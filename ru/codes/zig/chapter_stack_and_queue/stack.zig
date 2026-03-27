// File: stack.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализировать стек
    // В Zig рекомендуется использовать ArrayList как стек
    var stack = std.ArrayList(i32).init(std.heap.page_allocator);
    // Отложенное освобождение памяти
    defer stack.deinit();

    // Помещение элемента в стек
    try stack.append(1);
    try stack.append(3);
    try stack.append(2);
    try stack.append(5);
    try stack.append(4);
    std.debug.print("Стек stack = ", .{});
    inc.PrintUtil.printList(i32, stack);

    // Доступ к верхнему элементу стека
    var peek = stack.items[stack.items.len - 1];
    std.debug.print("\nВерхний элемент стека peek = {}", .{peek});

    // Извлечение элемента из стека
    var pop = stack.pop();
    std.debug.print("\nИзвлечен элемент pop = {}, стек после извлечения stack = ", .{pop});
    inc.PrintUtil.printList(i32, stack);

    // Получение длины стека
    var size = stack.items.len;
    std.debug.print("\nДлина стека size = {}", .{size});

    // Проверка, пуст ли стек
    var is_empty = if (stack.items.len == 0) true else false;
    std.debug.print("\nПуст ли стек = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
