// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// 関数
fn function() i32 {
    // 何らかの処理を行う
    return 0;
}

// 定数階
fn constant(n: i32) void {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // ループ内の変数は O(1) の空間を占める
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // ループ内の関数は O(1) の空間を占める
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// 線形階
fn linear(comptime n: i32) !void {
    // 長さ n の配列は O(n) の空間を使用
    const nums = [_]i32{0} ** n;
    // 長さ n のリストは O(n) の空間を使用
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
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

// 線形時間（再帰実装）
fn linearRecur(comptime n: i32) void {
    std.debug.print("再帰 n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// 二乗階
fn quadratic(n: i32) !void {
    // 二次元リストは O(n^2) の空間を使用
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

// 二次時間（再帰実装）
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("再帰 n = {} における nums の長さ = {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// 指数時間（完全二分木の構築）
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// 木のメモリを解放する
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
    // 定数階
    constant(n);
    // 線形階
    try linear(n);
    linearRecur(n);
    // 二乗階
    try quadratic(n);
    _ = quadraticRecur(n);
    // 指数オーダー
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
