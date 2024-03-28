// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化佇列
    const L = std.TailQueue(i32);
    var queue = L{};  

    // 元素入列
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
    std.debug.print("佇列 queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // 訪問佇列首元素
    var peek = queue.first.?.data;
    std.debug.print("\n佇列首元素 peek = {}", .{peek});

    // 元素出列
    var pop = queue.popFirst().?.data;
    std.debug.print("\n出列元素 pop = {}，出列後 queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // 獲取佇列的長度
    var size = queue.len;
    std.debug.print("\n佇列長度 size = {}", .{size});

    // 判斷佇列是否為空
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\n佇列是否為空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
