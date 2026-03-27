// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // Инициализация двоичного дерева
    // Инициализация узлов
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // Построить связи между узлами (указатели)
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("Инициализация двоичного дерева\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // Вставка и удаление узлов
    var p = inc.TreeNode(i32){ .val = 0 };
    // Вставить узел P между n1 -> n2
    n1.left = &p;
    p.left = &n2;
    std.debug.print("После вставки узла P\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // Удаление узла
    n1.left = &n2;
    std.debug.print("После удаления узла P\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

