// File: linkedlist_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Queue implemented with a linked list
pub fn LinkedListQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*inc.ListNode(T) = null,                // Head node front
        rear: ?*inc.ListNode(T) = null,                 // Tail node rear
        que_size: usize = 0,                            // Queue size
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Allocator

        // Initialize an empty queue and its arena allocator
        pub fn init(self: *Self, allocator: std.mem.Allocator) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.front = null;
            self.rear = null;
            self.que_size = 0;
        }

        // Deinitialize the arena and release its memory
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Get the queue size
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // Check whether the queue is empty
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Access the front element
        pub fn peek(self: *Self) T {
            if (self.size() == 0) @panic("Queue is empty");
            return self.front.?.val;
        }  

        // Enqueue
        pub fn push(self: *Self, num: T) !void {
            // Add num after the tail node
            var node = try self.mem_allocator.create(inc.ListNode(T));
            node.init(num);
            // If the queue is empty, make both the head and tail point to this node
            if (self.front == null) {
                self.front = node;
                self.rear = node;
            // If the queue is not empty, add this node after the tail node
            } else {
                self.rear.?.next = node;
                self.rear = node;
            }
            self.que_size += 1;
        } 

        // Dequeue
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // Remove the head node
            self.front = self.front.?.next;
            self.que_size -= 1;
            return num;
        } 

        // Copy the linked-list elements into an array
        pub fn toArray(self: *Self) ![]T {
            var node = self.front;
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            while (i < res.len) : (i += 1) {
                res[i] = node.?.val;
                node = node.?.next;
            }
            return res;
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the queue
    var queue = LinkedListQueue(i32){};
    try queue.init(std.heap.page_allocator);
    defer queue.deinit();

    // Enqueue elements
    try queue.push(1);
    try queue.push(3);
    try queue.push(2);
    try queue.push(5);
    try queue.push(4);
    std.debug.print("Queue queue = ", .{});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Access the front element
    var peek = queue.peek();
    std.debug.print("\nFront element peek = {}", .{peek});

    // Dequeue an element
    var pop = queue.pop();
    std.debug.print("\nDequeued element pop = {}; after dequeueing, queue = ", .{pop});
    inc.PrintUtil.printArray(i32, try queue.toArray());

    // Get the queue size
    var size = queue.size();
    std.debug.print("\nQueue size = {}", .{size});

    // Check whether the queue is empty
    var is_empty = queue.isEmpty();
    std.debug.print("\nIs the queue empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
