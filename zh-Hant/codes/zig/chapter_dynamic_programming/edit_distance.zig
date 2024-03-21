// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 编辑距离：暴力搜索
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // 若 s 为空，则返回 t 长度
    if (i == 0) {
        return @intCast(j);
    }
    // 若 t 为空，则返回 s 长度
    if (j == 0) {
        return @intCast(i);
    }
    // 若两字符相等，则直接跳过此两字符
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 返回最少编辑步数
    return @min(@min(insert, delete), replace) + 1;
}

// 编辑距离：记忆化搜索
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // 若 s 为空，则返回 t 长度
    if (i == 0) {
        return @intCast(j);
    }
    // 若 t 为空，则返回 s 长度
    if (j == 0) {
        return @intCast(i);
    }
    // 若已有记录，则直接返回之
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 若两字符相等，则直接跳过此两字符
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 记录并返回最少编辑步数
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// 编辑距离：动态规划
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // 状态转移：首行首列
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // 状态转移：其余行和列
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// 编辑距离：空间优化后的动态规划
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // 状态转移：首行
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // 状态转移：其余行
    for (1..n + 1) |i| {
        // 状态转移：首列
        var leftup = dp[0]; // 暂存 dp[i-1, j-1]
        dp[0] = @intCast(i);
        // 状态转移：其余列
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 若两字符相等，则直接跳过此两字符
                dp[j] = leftup;
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 更新为下一轮的 dp[i-1, j-1]
        }
    }
    return dp[m];
}

// Driver Code
pub fn main() !void {
    const s = "bag";
    const t = "pack";
    comptime var n = s.len;
    comptime var m = t.len;

    // 暴力搜索
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("将 {s} 更改为 {s} 最少需要编辑 {} 步\n", .{ s, t, res });

    // 记忆搜索
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("将 {s} 更改为 {s} 最少需要编辑 {} 步\n", .{ s, t, res });

    // 动态规划
    res = editDistanceDP(s, t);
    std.debug.print("将 {s} 更改为 {s} 最少需要编辑 {} 步\n", .{ s, t, res });

    // 空间优化后的动态规划
    res = editDistanceDPComp(s, t);
    std.debug.print("将 {s} 更改为 {s} 最少需要编辑 {} 步\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
