// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化队列
    const L = std.TailQueue(i32);
    var queue = L{};  

    // 元素入队
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
    std.debug.print("队列 queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // 访问队首元素
    var peek = queue.first.?.data;
    std.debug.print("\n队首元素 peek = {}", .{peek});

    // 元素出队
    var pop = queue.popFirst().?.data;
    std.debug.print("\n出队元素 pop = {}，出队后 queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // 获取队列的长度
    var size = queue.len;
    std.debug.print("\n队列长度 size = {}", .{size});

    // 判断队列是否为空
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\n队列是否为空 = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
