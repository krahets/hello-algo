// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализация очереди
    const L = std.TailQueue(i32);
    var queue = L{};  

    // Добавление элемента в очередь
    var node1 = L.Node{ .data = 1 };
    var node2 = L.Node{ .data = 3 };
    var node3 = L.Node{ .data = 2 };
    var node4 = L.Node{ .data = 5 };
    var node5 = L.Node{ .data = 4 };
    queue.append(&node1);
    queue.append(&node2);
    queue.append(&node3);
    queue.append(&node4);
    queue.append(&node5);
    std.debug.print("Очередь queue = ", .{});
    inc.PrintUtil.printQueue(i32, queue);

    // Доступ к элементу в начале очереди
    var peek = queue.first.?.data;
    std.debug.print("\nЭлемент в начале очереди peek = {}", .{peek});

    // Извлечение элемента из очереди
    var pop = queue.popFirst().?.data;
    std.debug.print("\nИзвлечен элемент pop = {}, очередь после извлечения queue = ", .{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // Получение длины очереди
    var size = queue.len;
    std.debug.print("\nДлина очереди size = {}", .{size});

    // Проверка, пуста ли очередь
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\nПуста ли очередь = {}", .{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
