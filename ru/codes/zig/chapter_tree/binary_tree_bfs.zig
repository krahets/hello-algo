// File: binary_tree_bfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Обход по уровням
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
            queue.append(tmp_node);             // Поместить левого потомка в очередь
        }
        if (node.right != null) {
            var tmp_node = try mem_allocator.create(L.Node);
            tmp_node.data = node.right.?;
            queue.append(tmp_node);             // Поместить правого потомка в очередь
        }        
    }
    return list;
}

// Driver Code
pub fn main() !void {
    // Инициализировать распределитель памяти
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Инициализировать двоичное дерево
    // Здесь используется функция, которая напрямую строит двоичное дерево из массива
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("Инициализировать двоичное дерево\n",.{});
    try inc.PrintUtil.printTree(root, null, false);

    // Обход по уровням
    var list = try levelOrder(i32, mem_allocator, root.?);
    defer list.deinit();
    std.debug.print("\nПоследовательность узлов при обходе по уровням =",.{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}
