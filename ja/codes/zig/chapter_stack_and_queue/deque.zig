// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 実行用コード
pub fn main() !void {
    // 両端キューを初期化する
    const L = std.TailQueue(i32);
    var deque = L{};  

    // 要素をエンキューする
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // キューの末尾に追加する
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // キューの先頭に追加する
    deque.prepend(&node5);
    std.debug.print("両端キュー deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // 要素にアクセスする
    var peek_first = deque.first.?.data; // キューの先頭要素
    std.debug.print("\nキューの先頭要素 peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // キューの末尾要素
    std.debug.print("\nキューの末尾要素 peek_last = {}", .{peek_last});

    // 要素をデキューする
    var pop_first = deque.popFirst().?.data;    // キューの先頭要素をデキューする
    std.debug.print("\n先頭からデキューした要素 pop_first = {}、先頭からデキューした後 deque = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // キューの末尾要素をデキューする
    std.debug.print("\n末尾からデキューした要素 pop_last = {}、末尾からデキューした後 deque = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // 両端キューの長さを取得する
    var size = deque.len;
    std.debug.print("\n両端キューの長さ size = {}", .{size});

    // 両端キューが空かどうかを判定する
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\n両端キューは空か = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
