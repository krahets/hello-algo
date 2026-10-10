// File: heap.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

fn lessThan(context: void, a: i32, b: i32) std.math.Order {
    _ = context;
    return std.math.order(a, b);
}

fn greaterThan(context: void, a: i32, b: i32) std.math.Order {
    return lessThan(context, a, b).invert();
}

fn testPush(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype, val: T) !void {
    try heap.add(val);  // Добавление элемента в кучу
    std.debug.print("\nПосле добавления элемента {} в кучу\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    // Извлечение элемента с вершины кучи
    std.debug.print("\nПосле извлечения элемента вершины кучи {}\n", .{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// Driver Code
pub fn main() !void {
    // Инициализация аллокатора памяти
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Инициализировать кучу
    // Инициализировать минимальную кучу
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var min_heap = PQlt.init(std.heap.page_allocator, {});
    defer min_heap.deinit();
    // Инициализация максимальной кучи
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var max_heap = PQgt.init(std.heap.page_allocator, {});
    defer max_heap.deinit();

    std.debug.print("\nНиже приведен тестовый пример для большой кучи", .{});

    // Добавление элемента в кучу
    try testPush(i32, mem_allocator, &max_heap, 1);
    try testPush(i32, mem_allocator, &max_heap, 3);
    try testPush(i32, mem_allocator, &max_heap, 2);
    try testPush(i32, mem_allocator, &max_heap, 5);
    try testPush(i32, mem_allocator, &max_heap, 4);

    // Получение элемента с вершины кучи
    var peek = max_heap.peek().?;
    std.debug.print("\nЭлемент на вершине кучи = {}\n", .{peek});

    // Извлечение элемента с вершины кучи
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);

    // Получить размер кучи
    var size = max_heap.len;
    std.debug.print("\nКоличество элементов в куче = {}\n", .{size});

    // Проверка, пуста ли куча
    var is_empty = if (max_heap.len == 0) true else false;
    std.debug.print("\nПуста ли куча: {}\n", .{is_empty});

    // Построить кучу по входному списку
    try min_heap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\nПосле построения мин-кучи из входного списка\n", .{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, min_heap);

    _ = try std.io.getStdIn().reader().readByte();
}