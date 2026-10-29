// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 実行用コード
pub fn main() !void {
    // キューを初期化する
    const L = std.TailQueue(i32);
    var queue = L{};  

    // 要素をエンキューする
    var node1 = L.Node{ .data = 1 };
    var node2 = L.Node{ .data = 3 };
    var node3 = L.Node{ .data = 2 };
    var node4 = L.Node{ .data = 5 };
    var node5 = L.Node{ .data = 4 };
    queue.append(&node1);
    queue.append(&node2);
    queue.append(&node3);
    queue.append(&node4);
    queue.append(&node5);
    std.debug.print("キュー queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // キューの先頭要素にアクセス
    var peek = queue.first.?.data;
    std.debug.print("\nキューの先頭要素 peek = {}", .{peek});

    // 要素をデキューする
    var pop = queue.popFirst().?.data;
    std.debug.print("\nデキューした要素 pop = {}、デキュー後 queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // キューの長さを取得
    var size = queue.len;
    std.debug.print("\nキューの長さ size = {}", .{size});

    // キューが空か判定
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\nキューは空か = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
