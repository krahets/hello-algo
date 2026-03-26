// File: deque.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализировать двустороннюю очередь
    const L = std.TailQueue(i32);
    var deque = L{};  

    // Поместить элемент в очередь
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
    std.debug.print("двусторонняя очередь deque =",.{});
    inc.PrintUtil.printQueue(i32, deque);

    // Получить доступ к элементу
    var peek_first = deque.first.?.data; // элемент в голове очереди
    std.debug.print("\nэлемент в голове очереди peek_first = {}",.{peek_first});
    var peek_last = deque.last.?.data;   // элемент в хвосте очереди
    std.debug.print("\nэлемент в хвосте очереди peek_last = {}",.{peek_last});

    // Извлечь элемент из очереди
    var pop_first = deque.popFirst().?.data;    // голова очередиИзвлечь элемент из очереди
    std.debug.print("\nЭлемент, извлеченный из головы очереди, pop_first = {}, deque после извлечения из головы =",.{pop_first});
    inc.PrintUtil.printQueue(i32, deque);
    var pop_last = deque.pop().?.data;          // хвост очередиИзвлечь элемент из очереди
    std.debug.print("\nЭлемент, извлеченный из хвоста очереди, pop_last = {}, deque после извлечения из хвоста =",.{pop_last});
    inc.PrintUtil.printQueue(i32, deque);

    // Получить длину двусторонней очереди
    var size = deque.len;
    std.debug.print("\nДлина двусторонней очереди size = {}",.{size});

    // Проверить, пуста ли двусторонняя очередь
    var is_empty = if (deque.len == 0) true else false;
    std.debug.print("\nдвусторонняя Очередь пуста: {}",.{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
