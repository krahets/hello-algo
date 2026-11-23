// File: list.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Driver code
pub fn run() !void {
    // Initialize the list
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit(); // Defer releasing the memory

    try nums.appendSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("List nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Access an element
    const num = nums.items[1];
    std.debug.print("Access the element at index 1: num = {}\n", .{num});

    // Update an element
    nums.items[1] = 0;
    std.debug.print("Update the element at index 1 to 0: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Clear the list
    nums.clearRetainingCapacity();
    std.debug.print("After clearing the list: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Append an element at the end
    try nums.append(1);
    try nums.append(3);
    try nums.append(2);
    try nums.append(5);
    try nums.append(4);
    std.debug.print("After appending elements: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Insert an element in the middle
    try nums.insert(3, 6);
    std.debug.print("Insert 6 at index 3: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Remove an element
    _ = nums.orderedRemove(3);
    std.debug.print("Remove the element at index 3: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Traverse the list by index
    var count: i32 = 0;
    var i: usize = 0;
    while (i < nums.items.len) : (i += 1) {
        count += nums.items[i];
    }

    // Iterate directly over the list elements
    count = 0;
    for (nums.items) |x| {
        count += x;
    }

    // Concatenate two lists
    var nums1 = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums1.deinit();
    try nums1.appendSlice(&[_]i32{ 6, 8, 7, 10, 9 });
    try nums.insertSlice(nums.items.len, nums1.items);
    std.debug.print("Append nums1 to nums: nums = {}\n", .{utils.fmt.slice(nums.items)});

    // Sort the list
    std.mem.sort(i32, nums.items, {}, comptime std.sort.asc(i32));
    std.debug.print("After sorting the list: nums = {}\n", .{utils.fmt.slice(nums.items)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "list" {
    try run();
}
