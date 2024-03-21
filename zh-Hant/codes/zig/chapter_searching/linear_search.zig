// File: linear_search.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 线性查找（数组）
fn linearSearchArray(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 遍历数组
    for (nums.items, 0..) |num, i| {
        // 找到目标元素， 返回其索引
        if (num == target) {
            return @intCast(i);
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

// 线性查找（链表）
pub fn linearSearchLinkedList(comptime T: type, node: ?*inc.ListNode(T), target: T) ?*inc.ListNode(T) {
    var head = node;
    // 遍历链表
    while (head != null) {
        // 找到目标节点，返回之
        if (head.?.val == target) return head;
        head = head.?.next;
    }
    return null;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // 在数组中执行线性查找
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 });
    var index = linearSearchArray(i32, nums, target);
    std.debug.print("目标元素 3 的索引 = {}\n", .{index});

    // 在链表中执行线性查找
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.listToLinkedList(i32, mem_allocator, nums);
    var node = linearSearchLinkedList(i32, head, target);
    std.debug.print("目标节点值 3 的对应节点对象为 ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}