// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// Прямой обход
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// Симметричный обход
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// Обратный обход
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
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
    std.debug.print("Инициализировать двоичное дерево\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // Прямой обход
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\nПоследовательность узлов при прямом обходе = ", .{});
    inc.PrintUtil.printList(i32, list);

    // Симметричный обход
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\nПоследовательность узлов при симметричном обходе = ", .{});
    inc.PrintUtil.printList(i32, list);

    // Обратный обход
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\nПоследовательность узлов при обратном обходе = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}
