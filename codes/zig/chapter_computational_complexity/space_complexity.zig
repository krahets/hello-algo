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
fn constant(n: usize) void {
    // 常量、变量、对象占用 O(1) 空间
    const a: i32 = 0;
    var nums = [_]i32{0}**10000;
    var node = inc.ListNode(i32){.val = 0};
    // 循环中的变量占用 O(1) 空间
    for (0..n) |_| {
        _ = 0;
    }
    // 循环中的函数占用 O(1) 空间
    for (0..n) |_| {
        _ = function();
    }
    _ = a;
    _ = nums;
    _ = node;
}

// 线性阶
fn linear(n: usize) !void {
    // 长度为 n 的列表占用 O(n) 空间
    var nums = std.ArrayList(usize).init(std.heap.page_allocator);
    defer nums.deinit();
    for (0..n) |_| {
        try nums.append(0);
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    var map = std.AutoArrayHashMap(usize, []const u8).init(std.heap.page_allocator);
    defer map.deinit();
    var strBuffer: [10]u8 = undefined;
    for (0..n) |i| {
        var str = try std.fmt.bufPrint(&strBuffer, "{d}", .{i});
        try map.put(i, str);
    }
}

// 线性阶（递归实现）
fn linearRecur(n: usize) void {
    std.debug.print("递归 n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// 平方阶
fn quadratic(n: usize) !void {
    // 二维列表占用 O(n^2) 空间
    var nodes = std.ArrayList(std.ArrayList(i32)).init(std.heap.page_allocator);
    defer nodes.deinit();
    for (0..n) |_| {
        var tmp = std.ArrayList(i32).init(std.heap.page_allocator);
        defer tmp.deinit();
        for (0..n) |_| {
            try tmp.append(0);
        }
        try nodes.append(tmp);
    }
}

// 平方阶（递归实现）
fn quadraticRecur(comptime n: usize) i32 {
    if (n <= 0) return 0;
    // 数组 nums 长度为 n, n-1, ..., 2, 1
    var nums = [_]i32{0}**n;
    _ = nums;
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