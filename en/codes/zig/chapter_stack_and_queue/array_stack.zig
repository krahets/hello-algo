// File: array_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Stack implemented with an array
pub fn ArrayStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack: ?std.ArrayList(T) = null,     

        // Initialize the stack's ArrayList
        pub fn init(self: *Self, allocator: std.mem.Allocator) void {
            if (self.stack == null) {
                self.stack = std.ArrayList(T).init(allocator);
            }
        }

        // Deinitialize and release the memory
        pub fn deinit(self: *Self) void {
            if (self.stack == null) return;
            self.stack.?.deinit();
        }

        // Get the stack size
        pub fn size(self: *Self) usize {
            return self.stack.?.items.len;
        }

        // Check whether the stack is empty
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Access the top element
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("Stack is empty");
            return self.stack.?.items[self.size() - 1];
        }  

        // Push
        pub fn push(self: *Self, num: T) !void {
            try self.stack.?.append(num);
        } 

        // Pop
        pub fn pop(self: *Self) T {
            var num = self.stack.?.pop();
            return num;
        } 

        // Return the backing ArrayList
        pub fn toList(self: *Self) std.ArrayList(T) {
            return self.stack.?;
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the stack
    var stack = ArrayStack(i32){};
    stack.init(std.heap.page_allocator);
    // Defer releasing the memory
    defer stack.deinit();

    // Push elements onto the stack
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("Stack stack = ", .{});
    inc.PrintUtil.printList(i32, stack.toList());

    // Access the top element
    var peek = stack.peek();
    std.debug.print("\nTop element peek = {}", .{peek});

    // Pop an element from the stack
    var top = stack.pop();
    std.debug.print("\nPopped element top = {}; after popping, stack = ", .{top});
    inc.PrintUtil.printList(i32, stack.toList());

    // Get the stack size
    var size = stack.size();
    std.debug.print("\nStack size = {}", .{size});

    // Check whether the stack is empty
    var is_empty = stack.isEmpty();
    std.debug.print("\nIs the stack empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
