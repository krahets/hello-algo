// File: linkedlist_deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Doubly linked list node
pub fn ListNode(comptime T: type) type {
    return struct {
        const Self = @This();
        
        val: T = undefined,     // Node value
        next: ?*Self = null,    // Pointer to the next node
        prev: ?*Self = null,    // Pointer to the previous node

        // Initialize a list node with the specified value
        pub fn init(self: *Self, x: i32) void {
            self.val = x;
            self.next = null;
            self.prev = null;
        }
    };
}

// Deque implemented with a doubly linked list
pub fn LinkedListDeque(comptime T: type) type {
    return struct {
        const Self = @This();

        front: ?*ListNode(T) = null,                    // Head node front
        rear: ?*ListNode(T) = null,                     // Tail node rear
        que_size: usize = 0,                             // Deque size
        mem_arena: ?std.heap.ArenaAllocator = null,
        mem_allocator: std.mem.Allocator = undefined,   // Allocator

        // Initialize an empty deque and its arena allocator
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

        // Get the deque size
        pub fn size(self: *Self) usize {
            return self.que_size;
        }

        // Check whether the deque is empty
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Enqueue operation
        pub fn push(self: *Self, num: T, is_front: bool) !void {
            var node = try self.mem_allocator.create(ListNode(T));
            node.init(num);
            // If the linked list is empty, make both front and rear point to node
            if (self.isEmpty()) {
                self.front = node;
                self.rear = node;
            // Enqueue at the front
            } else if (is_front) {
                // Add node to the head of the linked list
                self.front.?.prev = node;
                node.next = self.front;
                self.front = node;  // Update the head node
            // Enqueue at the rear
            } else {
                // Add node to the tail of the linked list
                self.rear.?.next = node;
                node.prev = self.rear;
                self.rear = node;   // Update the tail node
            }
            self.que_size += 1;      // Update the queue size
        } 

        // Enqueue at the front
        pub fn pushFirst(self: *Self, num: T) !void {
            try self.push(num, true);
        } 

        // Enqueue at the rear
        pub fn pushLast(self: *Self, num: T) !void {
            try self.push(num, false);
        } 
        
        // Dequeue operation
        pub fn pop(self: *Self, is_front: bool) T {
            if (self.isEmpty()) @panic("Deque is empty");
            var val: T = undefined;
            // When the queue size is 1, the head and tail point to the same node
            if (self.que_size == 1) {
                val = self.front.?.val;
                self.front = null;
                self.rear = null;
            }
            // Dequeue from the front
            else if (is_front) {
                val = self.front.?.val;     // Save the head node value
                // Remove the head node
                var fNext = self.front.?.next;
                fNext.?.prev = null;
                self.front.?.next = null;
                self.front = fNext;         // Update the head node
            // Dequeue from the rear
            } else {
                val = self.rear.?.val;      // Save the tail node value
                // Remove the tail node
                var rPrev = self.rear.?.prev;
                rPrev.?.next = null;
                self.rear.?.prev = null;
                self.rear = rPrev;          // Update the tail node
            }
            self.que_size -= 1;              // Update the queue size
            return val;
        } 

        // Dequeue from the front
        pub fn popFirst(self: *Self) T {
            return self.pop(true);
        } 

        // Dequeue from the rear
        pub fn popLast(self: *Self) T {
            return self.pop(false);
        } 

        // Access the front element
        pub fn peekFirst(self: *Self) T {
            if (self.isEmpty()) @panic("Deque is empty");
            return self.front.?.val;
        }  

        // Access the rear element
        pub fn peekLast(self: *Self) T {
            if (self.isEmpty()) @panic("Deque is empty");
            return self.rear.?.val;
        }

        // Return an array for printing
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
    // Initialize the deque
    var deque = LinkedListDeque(i32){};
    try deque.init(std.heap.page_allocator);
    defer deque.deinit();
    try deque.pushLast(3);
    try deque.pushLast(2);
    try deque.pushLast(5);
    std.debug.print("Deque deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Access an element
    var peek_first = deque.peekFirst();
    std.debug.print("\nFront element peek_first = {}", .{peek_first});
    var peek_last = deque.peekLast();
    std.debug.print("\nRear element peek_last = {}", .{peek_last});

    // Enqueue elements
    try deque.pushLast(4);
    std.debug.print("\nAfter enqueuing element 4 at the rear, deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    try deque.pushFirst(1);
    std.debug.print("\nAfter enqueuing element 1 at the front, deque = ", .{});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Dequeue an element
    var pop_last = deque.popLast();
    std.debug.print("\nElement removed from the rear = {}; after removal, deque = ", .{pop_last});
    inc.PrintUtil.printArray(i32, try deque.toArray());
    var pop_first = deque.popFirst();
    std.debug.print("\nElement removed from the front = {}; after removal, deque = ", .{pop_first});
    inc.PrintUtil.printArray(i32, try deque.toArray());

    // Get the deque size
    var size = deque.size();
    std.debug.print("\nDeque size = {}", .{size});

    // Check whether the deque is empty
    var is_empty = deque.isEmpty();
    std.debug.print("\nIs the deque empty? {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
