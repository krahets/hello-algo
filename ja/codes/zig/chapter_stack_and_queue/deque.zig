// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 両端キューを初期化
    const L = std.TailQueue(i32);
    var deque = L{};  

    // 要素をエンキュー
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // 末尾に追加する
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // 先頭に追加する
    deque.prepend(&node5);
    std.debug.print("両端キュー deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // 要素にアクセス
    var peek_first = deque.first.?.data; // 先頭要素
    std.debug.print("\n先頭要素 peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // 末尾要素
    std.debug.print("\n末尾要素 peek_last = {}", .{peek_last});

    // 要素をデキュー
    var pop_first = deque.popFirst().?.data;    // 先頭要素を取り出す
    std.debug.print("\n先頭からデキューした要素 pop_first = {}、先頭からデキュー後 deque = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // 末尾要素を取り出す
    std.debug.print("\n末尾からデキューした要素 pop_last = {}、末尾からデキュー後 deque = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // 両端キューの長さを取得
    var size = deque.len;
    std.debug.print("\n両端キューの長さ size = {}", .{size});

    // 両端キューが空かどうかを判定
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\n両端キューが空かどうか = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
