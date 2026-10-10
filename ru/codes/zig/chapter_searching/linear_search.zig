// File: linear_search.zig
// Created Time: 2023-01-13
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Линейный поиск (массив)
fn linearSearchArray(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Обход массива
    for (nums.items, 0..) |num, i| {
        // Найти целевой элемент и вернуть его индекс
        if (num == target) {
            return @intCast(i);
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

// Линейный поиск (связный список)
pub fn linearSearchLinkedList(comptime T: type, node: ?*inc.ListNode(T), target: T) ?*inc.ListNode(T) {
    var head = node;
    // Обойти связный список
    while (head != null) {
        // Найти целевой узел и вернуть его
        if (head.?.val == target) return head;
        head = head.?.next;
    }
    return null;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // Выполнить линейный поиск в массиве
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 });
    var index = linearSearchArray(i32, nums, target);
    std.debug.print("Индекс целевого элемента 3 = {}\n", .{index});

    // Выполнить линейный поиск в связном списке
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.listToLinkedList(i32, mem_allocator, nums);
    var node = linearSearchLinkedList(i32, head, target);
    std.debug.print("Объект узла со значением 3 = ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}