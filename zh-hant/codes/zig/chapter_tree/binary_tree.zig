// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 初始化二元樹
    // 初始化節點
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // 構建節點之間的引用（指標）
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("初始化二元樹\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // 插入與刪除節點
    var p = inc.TreeNode(i32){ .val = 0 };
    // 在 n1 -> n2 中間插入節點 P
    n1.left = &p;
    p.left = &n2;
    std.debug.print("插入節點 P 後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // 刪除節點
    n1.left = &n2;
    std.debug.print("刪除節點 P 後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

