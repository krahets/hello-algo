// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver code
pub fn main() !void {
    // Initialize the stack
    // In Zig, ArrayList can be used as a stack
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // Defer releasing the memory
    defer stack.deinit();

    // Push elements onto the stack
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("Stack stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // Access the top element
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\nTop element peek = {}", .{peek});

    // Pop an element from the stack
    var pop = stack.pop();
    std.debug.print("\nPopped element pop = {}; after popping, stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // Get the stack size
    var size = stack.items.len;
    std.debug.print("\nStack size = {}", .{size});

    // Check whether the stack is empty
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\nIs the stack empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
