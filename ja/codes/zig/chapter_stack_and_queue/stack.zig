// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 実行用コード
pub fn main() !void {
    // スタックを初期化する
    // Zig では ArrayList をスタックとして使うことを推奨する
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // メモリの解放を遅延させる
    defer stack.deinit();

    // 要素をプッシュする
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("スタック stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // スタックの先頭要素にアクセスする
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\nスタックの先頭要素 peek = {}", .{peek});

    // 要素をポップする
    var pop = stack.pop();
    std.debug.print("\nポップした要素 pop = {}、ポップ後 stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // スタックの長さを取得する
    var size = stack.items.len;
    std.debug.print("\nスタックの長さ size = {}", .{size});

    // スタックが空かどうかを判定する
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\nスタックは空か = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
