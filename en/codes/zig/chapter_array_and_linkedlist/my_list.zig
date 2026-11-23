// File: my_list.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// List type
const MyList = struct {
    const Self = @This();

    items: []i32, // Slice storing the list elements
    capacity: usize, // List capacity
    allocator: std.mem.Allocator, // Allocator

    extend_ratio: usize = 2, // Factor by which the list capacity grows each time

    // Initialize an empty list with an allocator
    pub fn init(allocator: std.mem.Allocator) Self {
        return Self{
            .items = &[_]i32{},
            .capacity = 0,
            .allocator = allocator,
        };
    }

    // Deinitialize the list and release its memory
    pub fn deinit(self: Self) void {
        self.allocator.free(self.allocatedSlice());
    }

    // Append an element at the end
    pub fn add(self: *Self, item: i32) !void {
        // Grow the capacity when adding an element would exceed it
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
        // Panic if the index is out of bounds; the same applies below
        if (index < 0 or index >= self.items.len) {
            @panic("Index out of bounds");
        }
        return self.items[index];
    }

    // Update an element
    pub fn set(self: *Self, index: usize, num: i32) void {
        // Panic if the index is out of bounds; the same applies below
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

        // Grow the capacity when adding an element would exceed it
        const newlen = self.items.len + 1;
        try self.ensureTotalCapacity(newlen);

        // Shift all elements at and after index `index` one position to the right
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
        // Shift all elements after index `index` one position to the left
        const item = self.items[index];
        var i = index;
        while (i < self.items.len - 1) : (i += 1) {
            self.items[i] = self.items[i + 1];
        }
        self.items.len -= 1;
        // Return the removed element
        return item;
    }

    // Return the list elements as a slice
    pub fn toArraySlice(self: *Self) ![]i32 {
        return self.toOwnedSlice(false);
    }

    // Return a slice of the elements, optionally resetting the list
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

    // Grow the list capacity
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

// Driver code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    // Initialize the list
    var nums = MyList.init(allocator);
    // Defer releasing the memory
    defer nums.deinit();

    // Append an element at the end
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
        "Insert 6 at index 3: nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Remove an element
    _ = nums.remove(3);
    std.debug.print(
        "Remove the element at index 3: nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Access an element
    const num = nums.get(1);
    std.debug.print("Access the element at index 1: num = {}\n", .{num});

    // Update an element
    nums.set(1, 0);
    std.debug.print(
        "Update the element at index 1 to 0: nums = {}\n",
        .{utils.fmt.slice(nums.items)},
    );

    // Test capacity growth
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        // The initial capacity is 20 in this implementation, so these appends do not trigger further growth
        try nums.add(i);
    }
    std.debug.print(
        "After appending: list nums = {}, capacity = {}, length = {}\n",
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
