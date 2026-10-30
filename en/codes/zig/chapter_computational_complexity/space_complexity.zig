// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// Function
fn function() i32 {
    // Perform some operations
    return 0;
}

// Constant complexity
fn constant(n: i32) void {
    // Constants, variables, and objects occupy O(1) space
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // Variables in the loop occupy O(1) space
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // Function calls in the loop occupy O(1) space
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// Linear complexity
fn linear(comptime n: i32) !void {
    // An array of length n uses O(n) space
    const nums = [_]i32{0} ** n;
    // A list of length n occupies O(n) space
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // A hash table containing n entries would occupy O(n) space
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

// Linear complexity (recursive implementation)
fn linearRecur(comptime n: i32) void {
    std.debug.print("Recursion: n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// Quadratic complexity
fn quadratic(n: i32) !void {
    // A two-dimensional list retaining n by n elements would occupy O(n^2) space
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

// Quadratic complexity (recursive implementation)
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("In the recursive call with n = {}, nums has length {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// Exponential complexity (building a perfect binary tree)
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// Free the tree's memory
fn freeTree(allocator: std.mem.Allocator, root: ?*const TreeNode(i32)) void {
    if (root == null) return;
    freeTree(allocator, root.?.left);
    freeTree(allocator, root.?.right);
    allocator.destroy(root.?);
}

// Driver code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    // Constant complexity
    constant(n);
    // Linear complexity
    try linear(n);
    linearRecur(n);
    // Quadratic complexity
    try quadratic(n);
    _ = quadraticRecur(n);
    // Exponential complexity
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
