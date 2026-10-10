// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // スタックを初期化する
    // zig では、ArrayList をスタックとして使うことが推奨される
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // メモリの遅延解放
    defer stack.deinit();

    // 要素をプッシュ
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("スタック stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // スタックトップの要素にアクセス
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\nスタックトップ要素 peek = {}", .{peek});

    // 要素をポップ
    var pop = stack.pop();
    std.debug.print("\nポップした要素 pop = {}，ポップ後の stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // スタックの長さを取得
    var size = stack.items.len;
    std.debug.print("\nスタックの長さ size = {}", .{size});

    // スタックが空かどうかを判定
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\nスタックが空かどうか = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
