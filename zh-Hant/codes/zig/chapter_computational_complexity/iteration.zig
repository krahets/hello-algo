// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for 循环
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // 循环求和 1, 2, ..., n-1, n
    for (1..n+1) |i| {
        res = res + @as(i32, @intCast(i));
    }
    return res;
} 

// while 循环
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += @intCast(i);
        i += 1;
    }
    return res;
}

//  while 循环（两次更新）
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while (i <= n) {
        res += @intCast(i);
        // 更新条件变量
        i += 1;
        i *= 2;
    }
    return res;
}

// 双层 for 循环
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // 循环 i = 1, 2, ..., n-1, n
    for (1..n+1) |i| {
        // 循环 j = 1, 2, ..., n-1, n
        for (1..n+1) |j| {
            var _str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{i, j});
            try res.appendSlice(_str);
        }
    }
    return res.toOwnedSlice();
}

// Driver Code
pub fn main() !void {
    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("\nfor 循环的求和结果 res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("\nwhile 循环的求和结果 res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("\nwhile 循环（两次更新）求和结果 res = {}\n", .{res});

    const allocator = std.heap.page_allocator;
    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("\n双层 for 循环的遍历结果 {s}\n", .{resStr});
}
