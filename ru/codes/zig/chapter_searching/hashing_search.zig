// File: hashing_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Хеш-поиск (массив)
fn hashingSearchArray(comptime T: type, map: std.AutoHashMap(T, T), target: T) T {
    // key хеш-таблицы: целевой элемент, value: индекс
    // Если такого key нет в хеш-таблице, вернуть -1
    if (map.getKey(target) == null) return -1;
    return map.get(target).?;
}

// Хеш-поиск (связный список)
fn hashingSearchLinkedList(comptime T: type, map: std.AutoHashMap(T, *inc.ListNode(T)), target: T) ?*inc.ListNode(T) {
    // key хеш-таблицы: значение целевого узла, value: объект узла
    // Если такого key нет в хеш-таблице, вернуть null
    if (map.getKey(target) == null) return null;
    return map.get(target);
}

// Driver Code
pub fn main() !void {
    var target: i32 = 3;

    // Хеш-поиск (массив)
    var nums = [_]i32{ 1, 5, 3, 2, 4, 7, 5, 9, 10, 8 };
    // Инициализация хеш-таблицы
    var map = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer map.deinit();
    for (nums, 0..) |num, i| {
        try map.put(num, @as(i32, @intCast(i)));    // key: элемент, value: индекс
    }
    var index = hashingSearchArray(i32, map, target);
    std.debug.print("Индекс целевого элемента 3 = {}\n", .{index});

    // Хеш-поиск (связный список)
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();
    var head = try inc.ListUtil.arrToLinkedList(i32, mem_allocator, &nums);
    // Инициализация хеш-таблицы
    var map1 = std.AutoHashMap(i32, *inc.ListNode(i32)).init(std.heap.page_allocator);
    defer map1.deinit();
    while (head != null) {
        try map1.put(head.?.val, head.?);
        head = head.?.next;
    }
    var node = hashingSearchLinkedList(i32, map1, target);
    std.debug.print("Объект узла со значением 3 = ", .{});
    try inc.PrintUtil.printLinkedList(i32, node);

    _ = try std.io.getStdIn().reader().readByte();
}

