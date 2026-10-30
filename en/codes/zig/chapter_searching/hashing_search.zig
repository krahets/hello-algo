// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Hash-based search (array)
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // Hash table key: target element; value: index
    // Return -1 if the hash table does not contain this key   
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// Hash-based search (linked list)
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // Hash table key: target node value; value: node object
    // If the hash table does not contain this key, return null 
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// Driver code
pub fn main() !void {
    var target: i32 = 3;

    // Hash-based search (array)
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // Initialize the hash table
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: element; value: index
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("Index of target element 3 = {}\n", .{index});

    // Hash-based search (linked list)
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // Initialize the hash table
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("The node object corresponding to target value 3 is ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

