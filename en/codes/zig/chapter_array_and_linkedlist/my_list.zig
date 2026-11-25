// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// List class
const MyList = struct {
    const Self = @This();

    items: []i32, // Array that stores the list elements
    capacity: usize, // List capacity
    allocator: std.mem.Allocator, // Memory allocator

    extend_ratio: usize = 2, // Factor by which the list capacity grows

    // Constructor (allocate memory and initialize the list)
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // Destructor (free memory)
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // Append an element
    pub fn add(self: *Self, item: i32) !void {
        // Increase capacity when the elements would no longer fit
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // Update an element
        self.items.len += 1;
        const new_item_ptr = &self.items[self.items.len - 1];
        new_item_ptr.* = item;
    }

    // Get the list length (current number of elements)
    pub fn getSize(self: *Self) usize {
        return self.items.len;
    }

    // Get the list capacity
    pub fn getCapacity(self: *Self) usize {
        return self.capacity;
    }

    // Access an element
    pub fn get(self: *Self, index: usize) i32 {
        // Throw an exception if the index is out of bounds, here and below
        if (index < 0 or index >= self.items.len) {
            @panic("Index out of bounds");
        }
        return self.items[index];
    }

    // Update an element
    pub fn set(self: *Self, index: usize, num: i32) void {
        // Throw an exception if the index is out of bounds, here and below
        if (index < 0 or index >= self.items.len) {
            @panic("Index out of bounds");
        }
        self.items[index] = num;
    }

    // Insert an element in the middle
    pub fn insert(self: *Self, index: usize, item: i32) !void {
        if (index < 0 or index >= self.items.len) {
            @panic("Index out of bounds");
        }

        // Increase capacity when the elements would no longer fit
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // Shift the elements from index onward one position to the right
        self.items.len += 1;
        var i = self.items.len - 1;
        while (i >= index) : (i -= 1) {
            self.items[i] = self.items[i - 1];
        }
        self.items[index] = item;
    }

    // Remove an element
    pub fn remove(self: *Self, index: usize) i32 {
        if (index < 0 or index >= self.getSize()) {
            @panic("Index out of bounds");
        }
        // Shift the elements after index one position to the left
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // Return the removed element
        return item;
    }

    // Convert the list to an array
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // Return a new slice and specify whether to reset or clear the list container
    pub fn toOwnedSlice(self: *Self, clear: bool) ![]i32 {
        const allocator = self.allocator;
        const old_memory = self.allocatedSlice();
        if (allocator.remap(old_memory, self.items.len)) |new_items| {
            if (clear) {
                self.* = init(allocator);
            }
            return new_items;
        }

        const new_memory = try allocator.alloc(i32, self.items.len);
        @memcpy(new_memory, self.items);
        if (clear) {
            self.clearAndFree();
        }
        return new_memory;
    }

    // Increase the list capacity
    fn ensureTotalCapacity(self: *Self, new_capacity: usize) !void {
        if (self.capacity >= new_capacity) return;
        const capcacity = if (self.capacity == 0) 10 else self.capacity;
        const better_capacity = capcacity * self.extend_ratio;

        const old_memory = self.allocatedSlice();
        if (self.allocator.remap(old_memory, better_capacity)) |new_memory| {
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        } else {
            const new_memory = try self.allocator.alloc(i32, better_capacity);
            @memcpy(new_memory[0..self.items.len], self.items);
            self.allocator.free(old_memory);
            self.items.ptr = new_memory.ptr;
            self.capacity = new_memory.len;
        }
    }

    fn clearAndFree(self: *Self, allocator: std.mem.Allocator) void {
        allocator.free(self.allocatedSlice());
        self.items.len = 0;
        self.capacity = 0;
    }

    fn allocatedSlice(self: Self) []i32 {
        return self.items.ptr[0..self.capacity];
    }
};

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the list
    var nums = MyList.init(allocator);
    // Defer freeing memory
    defer nums.deinit();

    // Append an element
    try nums.add(1);
    try nums.add(3);
    try nums.add(2);
    try nums.add(5);
    try nums.add(4);
    std.debug.print("List nums = {}, capacity = {}, length = {}\n", .{
        utils.fmt.slice(nums.items),
        nums.getCapacity(),
        nums.getSize(),
    });

    // Insert an element in the middle
    try nums.insert(3, 6);
    std.debug.print(
        "After inserting 6 at index 3, nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Remove an element
    _ = nums.remove(3);
    std.debug.print(
        "After removing the element at index 3, nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Access an element
    const num = nums.get(1);
    std.debug.print("Reading index 1 gives num = {}\n", .{num});

    // Update an element
    nums.set(1, 0);
    std.debug.print(
        "After setting the element at index 1 to 0, nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Test capacity growth
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // At i = 5, the list length would exceed its capacity, so the list grows
        try nums.add(i);
    }
    std.debug.print(
        "After increasing capacity, nums = {}, capacity = {}, length = {}\n",
        .{
            utils.fmt.slice(nums.items),
            nums.getCapacity(),
            nums.getSize(),
        },
    );

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "my_list" {
    try run();
}
