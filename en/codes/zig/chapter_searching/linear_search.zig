// File: linear_search.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Linear search (array)
fn linearSearchArray(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Traverse the array
    for (nums.items, 0..) |num, i| {
        // If the target element is found, return its index
        if (num == target) {
            return @intCast(i);
        }
    }
    // The target element was not found; return -1
    return -1;
}

// Linear search (linked list)
pub fn linearSearchLinkedList(comptime T: type, node: ?*inc.ListNode(T), target: T) ?*inc.ListNode(T) {
    var head = node;
    // Traverse the linked list
    while (head != null) {
        // The target node was found; return it
        if (head.?.val == target) return head;
        head = head.?.next;
    }
    return null;
}

// Driver code
pub fn main() !void {
    var target: i32 = 3;

    // Perform linear search on the array
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 });
    var index = linearSearchArray(i32, nums, target);
    std.debug.print("Index of target element 3 = {}\n", .{index});

    // Perform linear search on the linked list
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.listToLinkedList(i32, mem_allocator, nums);
    var node = linearSearchLinkedList(i32, head, target);
    std.debug.print("The node object corresponding to target value 3 is ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}