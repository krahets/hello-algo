// File: linkedlist_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 連結リストベースのキュー
pub fn LinkedListQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*inc.ListNode(T) = null,                // 先頭ノード front
        rear: ?*inc.ListNode(T) = null,                 // 末尾ノード rear
        que_size: usize = 0,                            // キューの長さ
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // メモリアロケータ

        // コンストラクタ（メモリ確保 + キューを初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // デストラクタ（メモリを解放する）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // キューの長さを取得
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // キューが空かどうかを判定
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // キュー先頭の要素にアクセス
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("キューが空です");
            return self.front.?.val;
        }  

        // エンキュー
        pub fn push(self: *Self, num: T) !void {
            // 末尾ノードの後ろに num を追加
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            // キューが空なら、先頭・末尾ノードをともにそのノードに設定
            if (self.front == null) {
                self.front = node;
                self.rear = node;
            // キューが空でなければ、そのノードを末尾ノードの後ろに追加
            } else {
                self.rear.?.next = node;
                self.rear = node;
            }
            self.que_size += 1;
        } 

        // デキュー
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // 先頭ノードを削除
            self.front = self.front.?.next;
            self.que_size -= 1;
            return num;
        } 

        // 連結リストを配列に変換
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

// Driver Code
pub fn main() !void {
    // キューを初期化
    var queue = LinkedListQueue(i32){};
    try queue.init(std.heap.page_allocator);
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

    _ = try std.io.getStdIn().reader().readByte();
}
