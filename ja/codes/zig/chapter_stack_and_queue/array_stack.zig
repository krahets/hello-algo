// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 配列で実装したスタック
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // コンストラクタ（メモリの確保とスタックの初期化）
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // デストラクタ（メモリの解放）
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // スタックの長さを取得する
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // スタックが空かどうかを判定する
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // スタックの先頭要素にアクセスする
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

// 実行用コード
pub fn main() !void {
    // スタックを初期化する
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // メモリの解放を遅延させる
    defer stack.deinit();

    // 要素をプッシュする
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("スタック stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // スタックの先頭要素にアクセスする
    var peek = stack.peek();
    std.debug.print("\nスタックの先頭要素 peek = {}", .{peek});

    // 要素をポップする
    var top = stack.pop();
    std.debug.print("\nポップした要素 pop = {}、ポップ後 stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // スタックの長さを取得する
    var size = stack.size();
    std.debug.print("\nスタックの長さ size = {}", .{size});

    // スタックが空かどうかを判定する
    var is_empty = stack.isEmpty();
    std.debug.print("\nスタックは空か = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
