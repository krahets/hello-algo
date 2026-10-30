// File: my_heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Simple heap implementation
pub fn MaxHeap(comptime T: type) type {
    return struct {
        const Self = @This();
        
        max_heap: ?std.ArrayList(T) = null,      // Use a dynamic list so that capacity growth is handled automatically

        // Initialize the heap from the input list
        pub fn init(self: *Self, allocator: std.mem.Allocator, nums: []const T) !void {
            if (self.max_heap != null) return;
            self.max_heap = std.ArrayList(T).init(allocator);
            // Place the list elements in the heap without changing their order
            try self.max_heap.?.appendSlice(nums);
            // Sift down from every non-leaf node
            var i: usize = parent(self.size() - 1) + 1;
            while (i > 0) : (i -= 1) {
                try self.siftDown(i - 1);
            }
        }

        // Deinitialize and release the memory
        pub fn deinit(self: *Self) void {
            if (self.max_heap != null) self.max_heap.?.deinit();
        }

        // Get the left child index
        fn left(i: usize) usize {
            return 2 * i + 1;
        }

        // Get the right child index
        fn right(i: usize) usize {
            return 2 * i + 2;
        }

        // Get the parent index
        fn parent(i: usize) usize {
            // return (i - 1) / 2; // Floor division
            return @divFloor(i - 1, 2);
        }

        // Swap elements
        fn swap(self: *Self, i: usize, j: usize) !void {
            var tmp = self.max_heap.?.items[i];
            try self.max_heap.?.replaceRange(i, 1, &[_]T{self.max_heap.?.items[j]});
            try self.max_heap.?.replaceRange(j, 1, &[_]T{tmp});
        }

        // Get the heap size
        pub fn size(self: *Self) usize {
            return self.max_heap.?.items.len;
        }

        // Check whether the heap is empty
        pub fn isEmpty(self: *Self) bool {
            return self.size() == 0;
        }

        // Access the top element of the heap
        pub fn peek(self: *Self) T {
            return self.max_heap.?.items[0];
        }  

        // Push an element onto the heap
        pub fn push(self: *Self, val: T) !void {
            // Add a node
            try self.max_heap.?.append(val);
            // Sift up
            try self.siftUp(self.size() - 1);
        }  

        // Sift up starting from node i
        fn siftUp(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // Get the parent of node i
                var p = parent(i);
                // Stop sifting when the root has been passed or the node needs no repair
                if (p < 0 or self.max_heap.?.items[i] <= self.max_heap.?.items[p]) break;
                // Swap the two nodes
                try self.swap(i, p);
                // Continue sifting up
                i = p;
            }
        }

        // Pop an element from the heap
        pub fn pop(self: *Self) !T {
            // Check for an empty heap
            if (self.isEmpty()) unreachable;
            // Swap the root with the rightmost leaf on the last level (swap the first and last elements)
            try self.swap(0, self.size() - 1);
            // Remove a node
            var val = self.max_heap.?.pop();
            // Sift down
            try self.siftDown(0);
            // Return the top element of the heap
            return val;
        } 

        // Sift down starting from node i
        fn siftDown(self: *Self, i_: usize) !void {
            var i = i_;
            while (true) {
                // Find the node with the largest value among i, l, and r, and store its index in ma
                var l = left(i);
                var r = right(i);
                var ma = i;
                if (l < self.size() and self.max_heap.?.items[l] > self.max_heap.?.items[ma]) ma = l;
                if (r < self.size() and self.max_heap.?.items[r] > self.max_heap.?.items[ma]) ma = r;
                // Stop if node i is largest or both child indices l and r are out of bounds
                if (ma == i) break;
                // Swap the two nodes
                try self.swap(i, ma);
                // Continue sifting down
                i = ma;
            }
        }

        fn lessThan(context: void, a: T, b: T) std.math.Order {
            _ = context;
            return std.math.order(a, b);
        }

        fn greaterThan(context: void, a: T, b: T) std.math.Order {
            return lessThan(context, a, b).invert();
        }

        // Print the heap (binary tree)
        pub fn print(self: *Self, mem_allocator: std.mem.Allocator) !void {
            const PQgt = std.PriorityQueue(T, void, greaterThan);
            var queue = PQgt.init(std.heap.page_allocator, {});
            defer queue.deinit();
            try queue.addSlice(self.max_heap.?.items);
            try inc.PrintUtil.printHeap(T, mem_allocator, queue);
        } 
    };
}

// Driver code
pub fn main() !void {
    // Initialize the allocator
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Initialize a max heap
    var max_heap = MaxHeap(i32){};
    try max_heap.init(std.heap.page_allocator, &[_]i32{ 9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2 });
    defer max_heap.deinit();
    std.debug.print("\nAfter building the heap from the input list\n", .{});
    try max_heap.print(mem_allocator);

    // Get the top element of the heap
    var peek = max_heap.peek();
    std.debug.print("\nHeap top = {}\n", .{peek});

    // Push an element onto the heap
    const val = 7;
    try max_heap.push(val);
    std.debug.print("\nAfter pushing {} onto the heap\n", .{val});
    try max_heap.print(mem_allocator);

    // Pop the top element from the heap
    peek = try max_heap.pop();
    std.debug.print("\nAfter popping the top element {}\n", .{peek});
    try max_heap.print(mem_allocator);

    // Get the heap size
    var size = max_heap.size();
    std.debug.print("\nNumber of heap elements: {}", .{size});

    // Check whether the heap is empty
    var is_empty = max_heap.isEmpty();
    std.debug.print("\nIs the heap empty? {}\n", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}

