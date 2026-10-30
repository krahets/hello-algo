// File: array_queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Queue implemented with a circular array
pub fn ArrayQueue(comptime T: type) type {
    return struct {
        const Self = @This();

        nums: []T = undefined,                          // Array that stores the queue elements     
        cap: usize = 0,                                 // Queue capacity
        front: usize = 0,                               // Index of the front element
        queSize: usize = 0,                             // Current number of queue elements
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Allocator

        // Allocate and initialize the backing array
        pub fn init(self: *Self, allocator: std.mem.Allocator, cap: usize) !void {
            if (self.mem_arena == null) {
                self.mem_arena = std.heap.ArenaAllocator.init(allocator);
                self.mem_allocator = self.mem_arena.?.allocator();
            }
            self.cap = cap;
            self.nums = try self.mem_allocator.alloc(T, self.cap);
            @memset(self.nums, @as(T, 0));
        }
        
        // Deinitialize the arena and release its memory
        pub fn deinit(self: *Self) void {
            if (self.mem_arena == null) return;
            self.mem_arena.?.deinit();
        }

        // Get the queue capacity
        pub fn capacity(self: *Self) usize {
            return self.cap;
        }

        // Get the queue size
        pub fn size(self: *Self) usize {
            return self.queSize;
        }

        // Check whether the queue is empty
        pub fn isEmpty(self: *Self) bool {
            return self.queSize == 0;
        }

        // Enqueue
        pub fn push(self: *Self, num: T) !void {
            if (self.size() == self.capacity()) {
                std.debug.print("Queue is full\n", .{});
                return;
            }
            // Calculate the index immediately after the rear element
            // Use modulo to wrap rear to the beginning when it passes the end of the array
            var rear = (self.front + self.queSize) % self.capacity();
            // Append num at the rear of the queue
            self.nums[rear] = num;
            self.queSize += 1;
        } 

        // Dequeue
        pub fn pop(self: *Self) T {
            var num = self.peek();
            // Advance the front index by one, wrapping to the start of the array if necessary
            self.front = (self.front + 1) % self.capacity();
            self.queSize -= 1;
            return num;
        } 

        // Access the front element
        pub fn peek(self: *Self) T {
            if (self.isEmpty()) @panic("Queue is empty");
            return self.nums[self.front];
        } 

        // Return a copy of the queue elements as an array
        pub fn toArray(self: *Self) ![]T {
            // Copy only the occupied queue elements
            var res = try self.mem_allocator.alloc(T, self.size());
            @memset(res, @as(T, 0));
            var i: usize = 0;
            var j: usize = self.front;
            while (i < self.size()) : ({ i += 1; j += 1; }) {
                res[i] = self.nums[j % self.capacity()];
            }
            return res;
        }
    };
}

// Driver code
pub fn main() !void {
    // Initialize the queue
    var capacity: usize = 10;
    var queue = ArrayQueue(i32){};
    try queue.init(std.heap.page_allocator, capacity);
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

    // Test the circular array
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        try queue.push(i);
        _ = queue.pop();
        std.debug.print("\nAfter enqueue/dequeue round {}, queue = ", .{i});
        inc.PrintUtil.printArray(i32, try queue.toArray());
    }

    _ = try std.io.getStdIn().reader().readByte();
}
