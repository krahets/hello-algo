// File: binary_tree.zig
// Created Time: 2023-01-14
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Driver code
pub fn main() !void {
    // Initialize the binary tree
    // Initialize the nodes
    var n1 = inc.TreeNode(i32){ .val = 1 };
    var n2 = inc.TreeNode(i32){ .val = 2 };
    var n3 = inc.TreeNode(i32){ .val = 3 };
    var n4 = inc.TreeNode(i32){ .val = 4 };
    var n5 = inc.TreeNode(i32){ .val = 5 };
    // Set up references (pointers) between the nodes
    n1.left = &n2;
    n1.right = &n3;
    n2.left = &n4;
    n2.right = &n5;
    std.debug.print("Initialize the binary tree\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    // Insert and remove nodes
    var p = inc.TreeNode(i32){ .val = 0 };
    // Insert node p between n1 and n2
    n1.left = &p;
    p.left = &n2;
    std.debug.print("After inserting node p\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);
    // Remove a node
    n1.left = &n2;
    std.debug.print("After removing node p\n", .{});
    try inc.PrintUtil.printTree(&n1, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}

