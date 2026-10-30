// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver code
pub fn main() !void {
    // Initialize the queue
    const L = std.TailQueue(i32);
    var queue = L{};  

    // Enqueue elements
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
    std.debug.print("Queue queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // Access the front element
    var peek = queue.first.?.data;
    std.debug.print("\nFront element peek = {}", .{peek});

    // Dequeue an element
    var pop = queue.popFirst().?.data;
    std.debug.print("\nDequeued element pop = {}; after dequeueing, queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // Get the queue size
    var size = queue.len;
    std.debug.print("\nQueue size = {}", .{size});

    // Check whether the queue is empty
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\nIs the queue empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
