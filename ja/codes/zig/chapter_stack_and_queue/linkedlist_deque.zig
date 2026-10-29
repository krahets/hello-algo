// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 双方向連結リストのノード
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // ノードの値
        next: ?*Self = null,    // 後続ノードへのポインタ
        prev: ?*Self = null,    // 前のノードへのポインタ

        // 指定された値で連結リストのノードを初期化する
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// 双方向連結リストで実装した両端キュー
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // 先頭ノード front
        rear: ?*ListNode(T) = null,                     // 末尾ノード rear
        que_size: usize = 0,                             // 両端キューの長さ
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // メモリアロケータ

        // コンストラクタ（メモリの確保とキューの初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // デストラクタ（メモリの解放）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // 両端キューの長さを取得する
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // 両端キューが空かどうかを判定する
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // エンキュー操作
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // 連結リストが空の場合、front と rear の両方が node を指すようにする
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // 先頭へのエンキュー操作
            } else if (is_front) {
                // node を連結リストの先頭に追加する
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // 先頭ノードを更新する
            // 末尾へのエンキュー操作
            } else {
                // node を連結リストの末尾に追加する
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // 末尾ノードを更新する
            }
            self.que_size += 1;      // キューの長さを更新する
        } 

        // 先頭にエンキューする
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // 末尾にエンキューする
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // デキュー操作
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("両端キューが空です");
            var val: T = undefined;
            // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
            if (self.que_size == 1) {
                val = self.front.?.val;
                self.front = null;
                self.rear = null;
            }
            // 先頭からのデキュー操作
            else if (is_front) {
                val = self.front.?.val;     // 先頭ノードの値を一時保存する
                // 先頭ノードを削除する
                var fNext = self.front.?.next;
                fNext.?.prev = null;
                self.front.?.next = null;
                self.front = fNext;         // 先頭ノードを更新する
            // 末尾からのデキュー操作
            } else {
                val = self.rear.?.val;      // 末尾ノードの値を一時保存する
                // 末尾ノードを削除する
                var rPrev = self.rear.?.prev;
                rPrev.?.next = null;
                self.rear.?.prev = null;
                self.rear = rPrev;          // 末尾ノードを更新する
            }
            self.que_size -= 1;              // キューの長さを更新する
            return val;
        } 

        // 先頭からデキューする
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // 末尾からデキューする
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // キューの先頭要素にアクセス
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("両端キューが空です");
            return self.front.?.val;
        }  

        // キューの末尾要素にアクセスする
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("両端キューが空です");
            return self.rear.?.val;
        }

        // 表示用の配列を返す
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// 実行用コード
pub fn main() !void {
    // 両端キューを初期化する
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("両端キュー deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 要素にアクセスする
    var peek_first = deque.peekFirst();
    std.debug.print("\nキューの先頭要素 peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\nキューの末尾要素 peek_last = {}", .{peek_last});

    // 要素をエンキューする
    try deque.pushLast(4);
    std.debug.print("\n要素 4 を末尾にエンキューした後 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\n要素 1 を先頭にエンキューした後 deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 要素をデキューする
    var pop_last = deque.popLast();
    std.debug.print("\n末尾からデキューした要素 = {}、末尾からデキューした後 deque = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\n先頭からデキューした要素 = {}、先頭からデキューした後 deque = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // 両端キューの長さを取得する
    var size = deque.size();
    std.debug.print("\n両端キューの長さ size = {}", .{size});

    // 両端キューが空かどうかを判定する
    var is_empty = deque.isEmpty();
    std.debug.print("\n両端キューは空か = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
