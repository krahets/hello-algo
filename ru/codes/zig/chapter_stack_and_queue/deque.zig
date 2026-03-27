// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализация двусторонней очереди
    const L = std.TailQueue(i32);
    var deque = L{};  

    // Добавление элемента в очередь
    var node1 = L.Node{ .data = 2 };
    var node2 = L.Node{ .data = 5 };
    var node3 = L.Node{ .data = 4 };
    var node4 = L.Node{ .data = 3 };
    var node5 = L.Node{ .data = 1 };
    deque.append(&node1);   // Добавить в хвост очереди
    deque.append(&node2);
    deque.append(&node3);
    deque.prepend(&node4);  // Добавить в голову очереди
    deque.prepend(&node5);
    std.debug.print("Двусторонняя очередь deque = ", .{});
    inc.PrintUtil.printQueue(i32, deque);

    // Доступ к элементу
    var peek_first = deque.first.?.data; // Элемент в голове очереди
    std.debug.print("\nЭлемент в начале очереди peek_first = {}", .{peek_first});
    var peek_last = deque.last.?.data;   // Элемент в хвосте очереди
    std.debug.print("\nЭлемент в конце очереди peek_last = {}", .{peek_last});

    // Извлечение элемента из очереди
    var pop_first = deque.popFirst().?.data;    // Извлечь элемент из головы очереди
    std.debug.print("\nИзвлечен элемент из головы pop_first = {}, deque после извлечения из головы = ", .{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // Извлечь элемент из хвоста очереди
    std.debug.print("\nИзвлечен элемент из хвоста pop_last = {}, deque после извлечения из хвоста = ", .{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // Получение длины двусторонней очереди
    var size = deque.len;
    std.debug.print("\nДлина двусторонней очереди size = {}", .{size});

    // Проверка, пуста ли двусторонняя очередь
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\nПуста ли двусторонняя очередь = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
