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
    try heap.add(val);  // Добавить элемент в кучу
    std.debug.print("\nЭлемент {} после добавления в кучу\n",.{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

fn testPop(comptime T: type, mem_allocator: std.mem.Allocator, heap: anytype) !void {
    var val = heap.remove();    // Извлечь верхний элемент из кучи
    std.debug.print("\nвершина кучиЭлемент {} после извлечения из кучи\n",.{val});
    try inc.PrintUtil.printHeap(T, mem_allocator, heap);
}

// Driver Code
pub fn main() !void {
    // Инициализировать распределитель памяти
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Инициализировать кучу
    // Инициализировать min-кучу
    const PQlt = std.PriorityQueue(i32, void, lessThan);
    var min_heap = PQlt.init(std.heap.page_allocator, {});
    defer min_heap.deinit();
    // Инициализировать max-кучу
    const PQgt = std.PriorityQueue(i32, void, greaterThan);
    var max_heap = PQgt.init(std.heap.page_allocator, {});
    defer max_heap.deinit();

    std.debug.print("\nНиже приведены тестовые примеры max-кучи",.{});

    // Добавить элемент в кучу
    try testPush(i32, mem_allocator, &max_heap, 1);
    try testPush(i32, mem_allocator, &max_heap, 3);
    try testPush(i32, mem_allocator, &max_heap, 2);
    try testPush(i32, mem_allocator, &max_heap, 5);
    try testPush(i32, mem_allocator, &max_heap, 4);

    // Получить верхний элемент кучи
    var peek = max_heap.peek().?;
    std.debug.print("\nвершина кучиэлементравно {}\n",.{peek});

    // Извлечь верхний элемент из кучи
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);
    try testPop(i32, mem_allocator, &max_heap);

    // Получить размер кучи
    var size = max_heap.len;
    std.debug.print("\nКоличество элементов в куче равно {}\n",.{size});

    // Проверить, пуста ли куча
    var is_empty = if (max_heap.len == 0) true else false;
    std.debug.print("\nкучапуст ли {}\n",.{is_empty});

    // Входсписокипостроение кучи
    try min_heap.addSlice(&[_]i32{ 1, 3, 2, 5, 4 });
    std.debug.print("\nВходсписокипостроитьmin-кучапосле\n",.{});
    try inc.PrintUtil.printHeap(i32, mem_allocator, min_heap);

    _ = try std.io.getStdIn().reader().readByte();
}
