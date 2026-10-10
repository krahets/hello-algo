// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver Code
pub fn main() !void {
    // 二分木を初期化する
    // ノードを初期化する
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // ノード間の参照（ポインタ）を構築する
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("二分木を初期化\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // ノードの挿入と削除
    var p = inc.TreeNode(i32){ .val = 0 };
    // n1 -> n2 の間にノード P を挿入
    n1.left = &p;
    p.left = &n2;
    std.debug.print("ノード P を挿入した後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // ノードを削除
    n1.left = &n2;
    std.debug.print("ノード P を削除した後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

