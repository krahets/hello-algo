// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// Функция
fn function() i32 {
    // Выполнить некоторые операции
    return 0;
}

// Постоянная сложность
fn constant(n: i32) void {
    // Константы, переменные и объекты занимают O(1) памяти
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // Переменные в цикле занимают O(1) памяти
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // Функции в цикле занимают O(1) памяти
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// Линейная сложность
fn linear(comptime n: i32) !void {
    // Массив длины n занимает O(n) памяти
    const nums = [_]i32{0} ** n;
    // Список длины n занимает O(n) памяти
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // Хеш-таблица длины n занимает O(n) памяти
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

// Линейная сложность (рекурсивная реализация)
fn linearRecur(comptime n: i32) void {
    std.debug.print("Рекурсия n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// Квадратичная сложность
fn quadratic(n: i32) !void {
    // Двумерный список занимает O(n^2) памяти
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

// Квадратичная сложность (рекурсивная реализация)
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("В рекурсии n = {} длина nums = {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// Экспоненциальная сложность (построение полного двоичного дерева)
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// Освободить память дерева
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
    // Постоянная сложность
    constant(n);
    // Линейная сложность
    try linear(n);
    linearRecur(n);
    // Квадратичная сложность
    try quadratic(n);
    _ = quadraticRecur(n);
    // Экспоненциальная сложность
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
