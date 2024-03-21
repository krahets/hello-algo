// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 雜湊查詢（陣列）
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // 雜湊表的 key: 目標元素，value: 索引
    // 若雜湊表中無此 key ，返回 -1   
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// 雜湊查詢（鏈結串列）
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // 雜湊表的 key: 目標節點值，value: 節點物件
    // 若雜湊表中無此 key ，返回 null 
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // 雜湊查詢（陣列）
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // 初始化雜湊表
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: 元素，value: 索引
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("目標元素 3 的索引 = {}\n", .{index});

    // 雜湊查詢（鏈結串列）
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // 初始化雜湊表
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("目標節點值 3 的對應節點物件為 ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

