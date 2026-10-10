// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Обход в ширину
fn levelOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
    // Инициализировать очередь и добавить корневой узел
    const L = std.TailQueue(*inc.TreeNode(T));
    var queue = L{};
    var root_node = try mem_allocator.create(L.Node);
    root_node.data = root;
    queue.append(root_node); 
    // Инициализировать список для хранения последовательности обхода
    var list = std.ArrayList(T).init(std.heap.page_allocator);
    while (queue.len > 0) {
        var queue_node = queue.popFirst().?;    // Извлечение из очереди
        var node = queue_node.data;
        try list.append(node.val);              // Сохранить значение узла
        if (node.left != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.left.?;
            queue.append(tmp_node);             // Поместить левый дочерний узел в очередь
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // Поместить правый дочерний узел в очередь
        }        
    }
    return list;
}

// Driver Code
pub fn main() !void {
    // Инициализация аллокатора памяти
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Инициализировать двоичное дерево
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("Инициализация двоичного дерева\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // Обход в ширину
    var list = try levelOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\nПоследовательность печати узлов при обходе в ширину = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}