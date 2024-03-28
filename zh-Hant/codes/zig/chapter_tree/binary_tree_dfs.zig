// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// 前序走訪
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// 中序走訪
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// 後序走訪
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
}

// Driver Code
pub fn main() !void {
    // 初始化記憶體分配器
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 初始化二元樹
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("初始化二元樹\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // 前序走訪
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\n前序走訪的節點列印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 中序走訪
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\n中序走訪的節點列印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 後序走訪
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\n後續走訪的節點列印序列 = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}