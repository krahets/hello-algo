// File: binary_tree_dfs.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

var list = std.ArrayList(i32).init(std.heap.page_allocator);

// 先行順走査
fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    try list.append(root.?.val);
    try preOrder(T, root.?.left);
    try preOrder(T, root.?.right);
}

// 中順走査
fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    try inOrder(T, root.?.left);
    try list.append(root.?.val);
    try inOrder(T, root.?.right);
}

// 後順走査
fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
    if (root == null) return;
    // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    try postOrder(T, root.?.left);
    try postOrder(T, root.?.right);
    try list.append(root.?.val);
}

// Driver Code
pub fn main() !void {
    // メモリアロケータを初期化する
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    const mem_allocator = mem_arena.allocator();

    // 二分木を初期化
    // ここでは、配列から直接二分木を生成する関数を利用する
    var nums = [_]i32{1, 2, 3, 4, 5, 6, 7};
    var root = try inc.TreeUtil.arrToTree(i32, mem_allocator, &nums);
    std.debug.print("二分木を初期化\n", .{});
    try inc.PrintUtil.printTree(root, null, false);

    // 先行順走査
    list.clearRetainingCapacity();
    try preOrder(i32, root);
    std.debug.print("\n前順走査のノード出力シーケンス = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 中順走査
    list.clearRetainingCapacity();
    try inOrder(i32, root);
    std.debug.print("\n中順走査のノード出力シーケンス = ", .{});
    inc.PrintUtil.printList(i32, list);

    // 後順走査
    list.clearRetainingCapacity();
    try postOrder(i32, root);
    std.debug.print("\n後順走査のノード出力シーケンス = ", .{});
    inc.PrintUtil.printList(i32, list);

    _ = try std.io.getStdIn().reader().readByte();
}