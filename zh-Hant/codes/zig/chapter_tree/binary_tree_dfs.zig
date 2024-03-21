// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// 前序遍历
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 访问优先级：根节点 -> 左子树 -> 右子树
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// 中序遍历
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 访问优先级：左子树 -> 根节点 -> 右子树
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// 后序遍历
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 访问优先级：左子树 -> 右子树 -> 根节点
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
}

// Driver Code
pub fn main() !void {
    // 初始化内存分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化二叉树
    // 这里借助了一个从数组直接生成二叉树的函数
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("初始化二叉树\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // 前序遍历
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\n前序遍历的节点打印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 中序遍历
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\n中序遍历的节点打印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 后序遍历
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\n后续遍历的节点打印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}