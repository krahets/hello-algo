// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver code
pub fn main() !void {
    // Initialize the deque
    const L = std.TailQueue(i32);
    var deque = L{};  

    // Enqueue elements
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // Add to the rear
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // Add to the front
    deque.prepend(&node5);
    std.debug.print("Deque deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // Access an element
    var peek_first = deque.first.?.data; // Front element
    std.debug.print("\nFront element peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // Rear element
    std.debug.print("\nRear element peek_last = {}", .{peek_last});

    // Dequeue an element
    var pop_first = deque.popFirst().?.data;    // Dequeue the front element
    std.debug.print("\nRemoved front element pop_first = {}; deque = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // Dequeue the rear element
    std.debug.print("\nRemoved rear element pop_last = {}; deque = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // Get the deque size
    var size = deque.len;
    std.debug.print("\nDeque size = {}", .{size});

    // Check whether the deque is empty
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\nIs the deque empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
