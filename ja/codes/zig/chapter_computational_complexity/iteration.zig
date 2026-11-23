// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for ループ
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // ループで 1, 2, ..., n-1, n の和を求める
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// while ループ
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 条件変数を初期化する
    // ループで 1, 2, ..., n-1, n の和を求める
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  while ループ（2 回の更新）
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 条件変数を初期化する
    // ループで 1, 4, 10, ... の和を求める
    while (i <= n) : ({
        // 条件変数を更新する
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// 二重 for ループ
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // i = 1, 2, ..., n-1, n のループ
    for (1..n + 1) |i| {
        // j = 1, 2, ..., n-1, n のループ
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// 実行用コード
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("for ループで求めた和 res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("while ループで求めた和 res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("while ループ（2 回の更新）で求めた和 res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("二重 for ループの走査結果 {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
