// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 哈希查找（数组）
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1   
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// 哈希查找（链表）
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 null 
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // 哈希查找（数组）
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // 初始化哈希表
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: 元素，value: 索引
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("目标元素 3 的索引 = {}\n", .{index});

    // 哈希查找（链表）
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // 初始化哈希表
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("目标节点值 3 的对应节点对象为 ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

