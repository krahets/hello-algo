// File: linkedlist_stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Stack implemented with a linked list
pub fn LinkedListStack(comptime T: type) type {
    return struct {
        const Self = @This();

        stack_top: ?*inc.ListNode(T) = null,             // Use the head node as the stack top
        stk_size: usize = 0,                             // Stack size
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,    // Allocator

        // Initialize an empty stack and its arena allocator
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.stack_top = null;
            self.stk_size = 0;
        }

        // Deinitialize the arena and release its memory
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Get the stack size
        pub fn size(self: *Self) usize {
            return self.stk_size;
        }

        // Check whether the stack is empty
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Access the top element
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("Stack is empty");
            return self.stack_top.?.val;
        }  

        // Push
        pub fn push(self: *Self, num: T) !void {
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            node.next = self.stack_top;
            self.stack_top = node;
            self.stk_size += 1;
        } 

        // Pop
        pub fn pop(self: *Self) T {
            var num = self.peek();
            self.stack_top = self.stack_top.?.next;
            self.stk_size -= 1;
            return num;
        } 

        // Copy the stack elements into an array
        pub fn toArray(self: *Self) ![]T {
            var node = self.stack_top;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[res.len - i - 1] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the stack
    var stack = LinkedListStack(i32){};
    try stack.init(std.heap.page_allocator);
    // Defer releasing the memory
    defer stack.deinit();

    // Push elements onto the stack
    try stack.push(1);
    try stack.push(3);
    try stack.push(2);
    try stack.push(5);
    try stack.push(4);
    std.debug.print("Stack stack = ", .{});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // Access the top element
    var peek = stack.peek();
    std.debug.print("\nTop element peek = {}", .{peek});

    // Pop an element from the stack
    var pop = stack.pop();
    std.debug.print("\nPopped element pop = {}; after popping, stack = ", .{pop});
    inc.PrintUtil.printArray(i32, try stack.toArray());

    // Get the stack size
    var size = stack.size();
    std.debug.print("\nStack size = {}", .{size});

    // Check whether the stack is empty
    var is_empty = stack.isEmpty();
    std.debug.print("\nIs the stack empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

