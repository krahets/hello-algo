// File: iteration.zig
// Created Time: 2023-09-27
// Author: QiLOL (pikaqqpika@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const Allocator = std.mem.Allocator;

// for 반복문
fn forLoop(n: usize) i32 {
    var res: i32 = 0;
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for (1..n + 1) |i| {
        res += @intCast(i);
    }
    return res;
}

// while 반복문
fn whileLoop(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while (i <= n) : (i += 1) {
        res += @intCast(i);
    }
    return res;
}

//  while 반복문(두 번 갱신)
fn whileLoopII(n: i32) i32 {
    var res: i32 = 0;
    var i: i32 = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 4, 10, ...의 합을 구한다
    while (i <= n) : ({
        // 조건 변수를 갱신한다
        i += 1;
        i *= 2;
    }) {
        res += @intCast(i);
    }
    return res;
}

// 이중 for 반복문
fn nestedForLoop(allocator: Allocator, n: usize) ![]const u8 {
    var res = std.ArrayList(u8).init(allocator);
    defer res.deinit();
    var buffer: [20]u8 = undefined;
    // i = 1, 2, ..., n-1, n을 반복한다
    for (1..n + 1) |i| {
        // j = 1, 2, ..., n-1, n을 반복한다
        for (1..n + 1) |j| {
            const str = try std.fmt.bufPrint(&buffer, "({d}, {d}), ", .{ i, j });
            try res.appendSlice(str);
        }
    }
    return res.toOwnedSlice();
}

// 실행 코드
pub fn run() !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const n: i32 = 5;
    var res: i32 = 0;

    res = forLoop(n);
    std.debug.print("for 반복문으로 구한 합 res = {}\n", .{res});

    res = whileLoop(n);
    std.debug.print("while 반복문으로 구한 합 res = {}\n", .{res});

    res = whileLoopII(n);
    std.debug.print("while 반복문(두 번 갱신)으로 구한 합 res = {}\n", .{res});

    const resStr = try nestedForLoop(allocator, n);
    std.debug.print("이중 for 반복문의 순회 결과: {s}\n", .{resStr});
    allocator.free(resStr);

    std.debug.print("\n", .{});
}

pub fn main() !void {
    try run();
}

test "interation" {
    try run();
}
