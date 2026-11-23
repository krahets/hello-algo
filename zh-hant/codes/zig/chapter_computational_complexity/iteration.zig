// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for 迴圈
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // 迴圈求和 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// while 迴圈
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 初始化條件變數
    // 迴圈求和 1, 2, ..., n-1, n
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  while 迴圈（兩次更新）
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 初始化條件變數
    // 迴圈求和 1, 4, 10, ...
    while (i <= n) : ({
        // 更新條件變數
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// 雙層 for 迴圈
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // 迴圈 i = 1, 2, ..., n-1, n
    for (1..n + 1) |i| {
        // 迴圈 j = 1, 2, ..., n-1, n
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// Driver Code
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("for 迴圈的求和結果 res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("while 迴圈的求和結果 res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("while 迴圈（兩次更新）求和結果 res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("雙層 for 迴圈的走訪結果 {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
