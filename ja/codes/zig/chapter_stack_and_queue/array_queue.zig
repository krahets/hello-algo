// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 循環配列ベースのキュー
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // キュー要素を格納する配列
        cap: usize = 0,                                 // キューの容量
        front: usize = 0,                               // 先頭ポインタ。先頭要素を指す
        queSize: usize = 0,                             // 末尾ポインタ。キューの末尾 + 1 を指す
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // メモリアロケータ

        // コンストラクタ（メモリを確保して配列を初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.cap = cap;
            self.nums = try self.mem_allocator.alloc(T, self.cap);
            @memset(self.nums, @as(T, 0));
        }
        
        // デストラクタ（メモリを解放する）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // キューの容量を取得
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // キューの長さを取得
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // キューが空かどうかを判定
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // エンキュー
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("キューがいっぱいです\n", .{});
                return;
            }
            // 末尾ポインタを計算し、末尾インデックス + 1 を指す
            // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
            var rear = (self.front + self.queSize) % self.capacity();
            // 末尾ノードの後ろに num を追加
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // デキュー
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // キュー先頭の要素にアクセス
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("キューが空です");
            return self.nums[self.front];
        } 

        // 配列を返す
        pub fn toArray(self: *Self) ![]T {
            // 有効長の範囲内のリスト要素のみを変換
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            var j: usize = self.front;
            while (i < self.size()) : ({ i += 1; j += 1; }) {
                res[i] = self.nums[j % self.capacity()];
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // キューを初期化
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
    defer queue.deinit();

    // 要素をエンキュー
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("キュー queue = ", .{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // キュー先頭の要素にアクセス
    var peek = queue.peek();
    std.debug.print("\n先頭要素 peek = {}", .{peek});

    // 要素をデキュー
    var pop = queue.pop();
    std.debug.print("\nデキューした要素 pop = {}、デキュー後 queue = ", .{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // キューの長さを取得
    var size = queue.size();
    std.debug.print("\nキューの長さ size = {}", .{size});

    // キューが空かどうかを判定
    var is_empty = queue.isEmpty();
    std.debug.print("\nキューが空かどうか = {}", .{is_empty});

    // 循環配列をテストする
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\n第 {} 回のエンキュー + デキュー後 queue = ", .{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
