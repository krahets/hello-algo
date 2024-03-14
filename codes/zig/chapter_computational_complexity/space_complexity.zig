// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 函数
fn function() i32 {
    // 执行某些操作
    return 0;
}

// 常数阶
fn constant(n: i32) void {
    // 常量、变量、对象占用 O(1) 空间
    const a: i32 = 0;
    var b: i32 = 0;
    var nums = [_]i32{0}**10000;
    var node = inc.ListNode(i32){.val = 0};
    var i: i32 = 0;
    // 循环中的变量占用 O(1) 空间
    while (i < n) : (i += 1) {
        var c: i32 = 0;
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
    var nums = [_]i32{0}**n;
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
    var nums = [_]i32{0}**n;
    std.debug.print("递归 n = {} 中的 nums 长度 = {}\n", .{n, nums.len});
    return quadraticRecur(n - 1);
}

// 指数阶（建立满二叉树）
fn buildTree(mem_allocator: std.mem.Allocator, n: i32) !?*inc.TreeNode(i32) {
    if (n == 0) return null;
    const root = try mem_allocator.create(inc.TreeNode(i32));
    root.init(0);
    root.left = try buildTree(mem_allocator, n - 1);
    root.right = try buildTree(mem_allocator, n - 1);
    return root;
}

// Driver Code
pub fn main() !void {
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
    var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer mem_arena.deinit();
    var root = blk_root: {
        const mem_allocator = mem_arena.allocator();
        break :blk_root try buildTree(mem_allocator, n);
    };
    try inc.PrintUtil.printTree(root, null, false);

    _ = try std.io.getStdIn().reader().readByte();
}