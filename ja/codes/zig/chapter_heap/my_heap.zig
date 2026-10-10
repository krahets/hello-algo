// File: my_heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// ヒープクラスの簡易実装
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        max_heap: ?std.ArrayList(T) = null,      // 配列ではなくリストを使うことで、拡張を考慮する必要がない

        // コンストラクタ。入力リストに基づいてヒープを構築する
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.max_heap != null) return;
            self.max_heap = std.ArrayList(T).init(allocator);
            // リスト要素をそのままヒープに追加
            try self.max_heap.?.appendSlice(nums);
            // 葉ノード以外のすべてのノードをヒープ化
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // デストラクタ。メモリを解放
        pub fn deinit(self: *Self) void {
            if (self.max_heap != null) self.max_heap.?.deinit();
        }

        // 左子ノードのインデックスを取得
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // 右子ノードのインデックスを取得
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // 親ノードのインデックスを取得
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // 切り捨て除算
            return @divFloor(i - 1, 2);
        }

        // 要素を交換
        fn swap(self: *Self, i: usize, j: usize) !void {
            var tmp = self.max_heap.?.items[i];
            try self.max_heap.?.replaceRange(i, 1, &[_]T{self.max_heap.?.items[j]});
            try self.max_heap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // ヒープのサイズを取得
        pub fn size(self: *Self) usize {
            return self.max_heap.?.items.len;
        }

        // ヒープが空かどうかを判定
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // ヒープ先頭要素にアクセス
        pub fn peek(self: *Self) T {
            return self.max_heap.?.items[0];
        }  

        // 要素をヒープに追加
        pub fn push(self: *Self, val: T) !void {
            // ノードを追加
            try self.max_heap.?.append(val);
            // 下から上へヒープ化
            try self.siftUp(self.size() - 1);
        }  

        // ノード i から始めて、下から上へヒープ化
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // ノード i の親ノードを取得
                var p = parent(i);
                // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
                if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
                // 2 つのノードを交換
                try self.swap(i, p);
                // ループで下から上へヒープ化
                i = p;
            }
        }

        // 要素をヒープから取り出す
        pub fn pop(self: *Self) !T {
            // 判定処理
            if (self.isEmpty()) unreachable;
            // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
            try self.swap(0, self.size() - 1);
            // ノードを削除
            var val = self.max_heap.?.pop();
            // 上から下へヒープ化
            try self.siftDown(0);
            // ヒープ先頭要素を返す
            return val;
        } 

        // ノード i から始めて、上から下へヒープ化
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // ノード i, l, r のうち値が最大のノードを ma とする
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
                if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
                // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
                if (ma == i) break;
                // 2 つのノードを交換
                try self.swap(i, ma);
                // ループで上から下へヒープ化
                i = ma;
            }
        }

        fn lessThan(context: void, a: T, b: T) std.math.Order {
            _ = context;
            return std.math.order(a, b);
        }

        fn greaterThan(context: void, a: T, b: T) std.math.Order {
            return lessThan(context, a, b).invert();
        }

        // ヒープ（二分木）を出力
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.max_heap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// Driver Code
pub fn main() !void {
    // メモリアロケータを初期化する
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 最大ヒープを初期化
    var max_heap = MaxHeap(i32){};
    try max_heap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer max_heap.deinit();
    std.debug.print("\nリストを入力してヒープを構築した後\n", .{});
    try max_heap.print(mem_allocator);

    // ヒープ頂点の要素を取得
    var peek = max_heap.peek();
    std.debug.print("\nヒープの先頭要素は {}\n", .{peek});

    // 要素をヒープに追加
    const val = 7;
    try max_heap.push(val);
    std.debug.print("\n要素 {} をヒープに追加した後\n", .{val});
    try max_heap.print(mem_allocator);

    // ヒープ頂点の要素を取り出す
    peek = try max_heap.pop();
    std.debug.print("\nヒープの先頭要素 {} を取り出した後\n", .{peek});
    try max_heap.print(mem_allocator);

    // ヒープのサイズを取得
    var size = max_heap.size();
    std.debug.print("\nヒープ要素数は {}", .{size});

    // ヒープが空かどうかを判定
    var is_empty = max_heap.isEmpty();
    std.debug.print("\nヒープが空かどうか {}\n", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

