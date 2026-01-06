// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// 函式
fn function() i32 {
    // 執行某些操作
    return 0;
}

// 常數階
fn constant(n: i32) void {
    // 常數、變數、物件佔用 O(1) 空間
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // 迴圈中的變數佔用 O(1) 空間
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // 迴圈中的函式佔用 O(1) 空間
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// 線性階
fn linear(comptime n: i32) !void {
    // 長度為 n 的陣列佔用 O(n) 空間
    const nums = [_]i32{0} ** n;
    // 長度為 n 的串列佔用 O(n) 空間
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // 長度為 n 的雜湊表佔用 O(n) 空間
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

// 線性階（遞迴實現）
fn linearRecur(comptime n: i32) void {
    std.debug.print("遞迴 n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// 平方階
fn quadratic(n: i32) !void {
    // 二維串列佔用 O(n^2) 空間
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

// 平方階（遞迴實現）
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("遞迴 n = {} 中的 nums 長度 = {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// 指數階（建立滿二元樹）
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// 釋放樹的記憶體
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
    // 常數階
    constant(n);
    // 線性階
    try linear(n);
    linearRecur(n);
    // 平方階
    try quadratic(n);
    _ = quadraticRecur(n);
    // 指數階
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
