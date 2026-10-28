// File: space_complexity.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");
const ListNode = utils.ListNode;
const TreeNode = utils.TreeNode;

// 함수
fn function() i32 {
    // 몇 가지 연산을 수행한다
    return 0;
}

// 상수 차수
fn constant(n: i32) void {
    // 상수, 변수, 객체는 O(1) 공간을 차지한다
    const a: i32 = 0;
    const b: i32 = 0;
    const nums = [_]i32{0} ** 10000;
    const node = ListNode(i32){ .val = 0 };
    var i: i32 = 0;
    // 반복문 안의 변수는 O(1) 공간을 차지한다
    while (i < n) : (i += 1) {
        const c: i32 = 0;
        _ = c;
    }
    // 반복문 안의 함수는 O(1) 공간을 차지한다
    i = 0;
    while (i < n) : (i += 1) {
        _ = function();
    }
    _ = a;
    _ = b;
    _ = nums;
    _ = node;
}

// 선형 차수
fn linear(comptime n: i32) !void {
    // 길이가 n인 배열은 O(n) 공간을 차지한다
    const nums = [_]i32{0} ** n;
    // 길이가 n인 리스트는 O(n) 공간을 차지한다
    var nodes = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nodes.deinit();
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        try nodes.append(i);
    }
    // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
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

// 선형 차수(재귀 구현)
fn linearRecur(comptime n: i32) void {
    std.debug.print("재귀 호출 n = {}\n", .{n});
    if (n == 1) return;
    linearRecur(n - 1);
}

// 제곱 차수
fn quadratic(n: i32) !void {
    // 이차원 리스트는 O(n^2) 공간을 차지한다
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

// 제곱 차수(재귀 구현)
fn quadraticRecur(comptime n: i32) i32 {
    if (n <= 0) return 0;
    const nums = [_]i32{0} ** n;
    std.debug.print("재귀 호출 n = {}에서 nums의 길이 = {}\n", .{ n, nums.len });
    return quadraticRecur(n - 1);
}

// 지수 차수(포화 이진 트리 구성)
fn buildTree(allocator: std.mem.Allocator, n: i32) !?*TreeNode(i32) {
    if (n == 0) return null;
    const root = try allocator.create(TreeNode(i32));
    root.init(0);
    root.left = try buildTree(allocator, n - 1);
    root.right = try buildTree(allocator, n - 1);
    return root;
}

// 트리의 메모리를 해제한다
fn freeTree(allocator: std.mem.Allocator, root: ?*const TreeNode(i32)) void {
    if (root == null) return;
    freeTree(allocator, root.?.left);
    freeTree(allocator, root.?.right);
    allocator.destroy(root.?);
}

// 실행 코드
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    // 상수 차수
    constant(n);
    // 선형 차수
    try linear(n);
    linearRecur(n);
    // 제곱 차수
    try quadratic(n);
    _ = quadraticRecur(n);
    // 지수 차수
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
