// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 実行用コード
pub fn main() !void {
    // 二分木を初期化する
    // ノードを初期化する
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // ノード間の参照（ポインタ）を設定する
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("二分木を初期化する\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // ノードの挿入と削除
    var p = inc.TreeNode(i32){ .val = 0 };
    // n1 -> n2 の間にノード P を挿入する
    n1.left = &p;
    p.left = &n2;
    std.debug.print("ノード P の挿入後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // ノードを削除する
    n1.left = &n2;
    std.debug.print("ノード P の削除後\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

