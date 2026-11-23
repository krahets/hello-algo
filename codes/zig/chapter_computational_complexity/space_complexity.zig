// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// 函数
fn function() i32 {
    // 执行某些操作
    return 0;
}

// 常数阶
fn constant(n: i32) void {
    // 常量、变量、对象占用 O(1) 空间
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // 循环中的变量占用 O(1) 空间
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // 循环中的函数占用 O(1) 空间
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// 线性阶
fn linear(comptime n: i32) !void {
    // 长度为 n 的数组占用 O(n) 空间
    const nums = [_]i32{0} ** n;
    // 长度为 n 的列表占用 O(n) 空间
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    var map = std.AutoArrayHashMap(i32, []const u8).init(std.heap.page_allocator);
    defer map.deinit();
    var j: i32 = 0;
    while (j < n) : (j += 1) {
        const string = try std.fmt.allocPrint(std.heap.page_allocator, "{d}", .{j});
        defer std.heap.page_allocator.free(string);
        try map.put(i, string);
    }
    _ = nums;
}

// 线性阶（递归实现）
fn linearRecur(comptime n: i32) void {
    std.debug.print("递归 n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// 平方阶
fn quadratic(n: i32) !void {
    // 二维列表占用 O(n^2) 空间
    var nodes = std.ArrayList(std.ArrayList(i32)).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        var tmp = std.ArrayList(i32).init(std.heap.page_allocator);
        defer tmp.deinit();
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            try tmp.append(0);
        }
        try nodes.append(tmp);
    }
}

// 平方阶（递归实现）
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("递归 n = {} 中的 nums 长度 = {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// 指数阶（建立满二叉树）
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// 释放树的内存
fn freeTree(allocator: std.mem.Allocator, root: ?*const TreeNode(i32)) void {
    if (root == null) return;
    freeTree(allocator, root.?.left);
    freeTree(allocator, root.?.right);
    allocator.destroy(root.?);
}

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    // 常数阶
    constant(n);
    // 线性阶
    try linear(n);
    linearRecur(n);
    // 平方阶
    try quadratic(n);
    _ = quadraticRecur(n);
    // 指数阶
    const root = try buildTree(allocator, n);
    defer freeTree(allocator, root);
    std.debug.print("{}\n", .{utils.fmt.tree(i32, root)});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "space_complexity" {
    try run();
}
