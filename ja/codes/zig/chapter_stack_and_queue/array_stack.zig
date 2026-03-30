// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 配列ベースのスタック
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // コンストラクタ（メモリを確保してスタックを初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // デストラクタ（メモリを解放）
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // スタックの長さを取得
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // スタックが空かどうかを判定
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // スタックトップの要素にアクセス
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("スタックが空です");
            return self.stack.?.items[self.size() - 1];
        }  

        // プッシュ
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // ポップ
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // ArrayList を返す
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// Driver Code
pub fn main() !void {
    // スタックを初期化
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // メモリの遅延解放
    defer stack.deinit();

    // 要素をプッシュ
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("スタック stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // スタックトップの要素にアクセス
    var peek = stack.peek();
    std.debug.print("\nスタックトップ要素 peek = {}", .{peek});

    // 要素をポップ
    var top = stack.pop();
    std.debug.print("\nポップした要素 pop = {}、ポップ後 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // スタックの長さを取得
    var size = stack.size();
    std.debug.print("\nスタックの長さ size = {}", .{size});

    // スタックが空かどうかを判定
    var is_empty = stack.isEmpty();
    std.debug.print("\nスタックが空かどうか = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
