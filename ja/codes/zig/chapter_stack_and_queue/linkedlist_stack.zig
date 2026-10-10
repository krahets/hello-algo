// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 連結リストベースのスタック
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // 先頭ノードをスタックトップとする
        stk_size: usize = 0,                             // スタックの長さ
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // メモリアロケータ

        // コンストラクタ（メモリを確保してスタックを初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // デストラクタ（メモリを解放する）
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // スタックの長さを取得
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // スタックが空かどうかを判定
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // スタックトップの要素にアクセス
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("スタックが空です");
            return self.stack_top.?.val;
        }  

        // プッシュ
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // ポップ
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // スタックを配列に変換
        pub fn toArray(self: *Self) ![]T {
            var node = self.stack_top;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[res.len - i - 1] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver Code
pub fn main() !void {
    // スタックを初期化
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // メモリの遅延解放
    defer stack.deinit();

    // 要素をプッシュ
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("スタック stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // スタックトップの要素にアクセス
    var peek = stack.peek();
    std.debug.print("\nスタック頂部の要素 top = {}", .{peek});

    // 要素をポップ
    var pop = stack.pop();
    std.debug.print("\nポップした要素 pop = {}，ポップ後の stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // スタックの長さを取得
    var size = stack.size();
    std.debug.print("\nスタックの長さ size = {}", .{size});

    // スタックが空かどうかを判定
    var is_empty = stack.isEmpty();
    std.debug.print("\nスタックが空かどうか = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

