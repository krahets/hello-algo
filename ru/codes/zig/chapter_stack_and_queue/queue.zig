// File: queue.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализировать очередь
    const L = std.TailQueue(i32);
    var queue = L{};  

    // Поместить элемент в очередь
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
    std.debug.print("очередь queue =",.{});
    inc.PrintUtil.printQueue(i32, queue);

    // Получить элемент в начале очереди
    var peek = queue.first.?.data;
    std.debug.print("\nэлемент в голове очереди peek = {}",.{peek});

    // Извлечь элемент из очереди
    var pop = queue.popFirst().?.data;
    std.debug.print("\nЭлемент, извлеченный из очереди, pop = {}, queue после извлечения =",.{pop});
    inc.PrintUtil.printQueue(i32, queue);

    // Получить длину очереди
    var size = queue.len;
    std.debug.print("\nДлина очереди size = {}",.{size});

    // Проверить, пуста ли очередь
    var is_empty = if (queue.len == 0) true else false;
    std.debug.print("\nОчередь пуста: {}",.{is_empty});

    _ = try std.io.getStdIn().reader().readByte();
}
