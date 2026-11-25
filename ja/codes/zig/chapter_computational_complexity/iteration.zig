// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for ループ
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // 1, 2, ..., n-1, n の和をループで求める
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// while ループ
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 条件判定用の変数を初期化
    // 1, 2, ..., n-1, n の和をループで求める
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  while ループ（2 回更新）
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 条件判定用の変数を初期化
    // 1, 4, 10, ... の和をループで求める
    while (i <= n) : ({
        // 条件判定用の変数を更新
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// 二重の for ループ
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for (1..n + 1) |i| {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// 実行例
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("for ループによる総和 res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("while ループによる総和 res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("while ループ（2 回更新）による総和 res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("二重の for ループの走査結果 {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
