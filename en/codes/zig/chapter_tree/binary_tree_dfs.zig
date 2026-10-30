// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// Preorder traversal
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Visit order: root -> left subtree -> right subtree
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// Inorder traversal
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Visit order: left subtree -> root -> right subtree
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// Postorder traversal
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // Visit order: left subtree -> right subtree -> root
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
}

// Driver code
pub fn main() !void {
    // Initialize the allocator
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // Initialize the binary tree
    // Use a helper function that builds a binary tree directly from an array
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("Initialize the binary tree\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // Preorder traversal
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\nNode sequence from preorder traversal = ", .{});
    inc.PrintUtil.printList(i32, list);

    // Inorder traversal
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\nNode sequence from inorder traversal = ", .{});
    inc.PrintUtil.printList(i32, list);

    // Postorder traversal
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\nPostorder traversal sequence = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}