// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 編輯距離：暴力搜尋
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // 若 s 和 t 都為空，則返回 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // 若 s 為空，則返回 t 長度
    if (i == 0) {
        return @intCast(j);
    }
    // 若 t 為空，則返回 s 長度
    if (j == 0) {
        return @intCast(i);
    }
    // 若兩字元相等，則直接跳過此兩字元
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 返回最少編輯步數
    return @min(@min(insert, delete), replace) + 1;
}

// 編輯距離：記憶化搜尋
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // 若 s 和 t 都為空，則返回 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // 若 s 為空，則返回 t 長度
    if (i == 0) {
        return @intCast(j);
    }
    // 若 t 為空，則返回 s 長度
    if (j == 0) {
        return @intCast(i);
    }
    // 若已有記錄，則直接返回之
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // 若兩字元相等，則直接跳過此兩字元
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 記錄並返回最少編輯步數
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// 編輯距離：動態規劃
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // 狀態轉移：首行首列
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // 狀態轉移：其餘行和列
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// 編輯距離：空間最佳化後的動態規劃
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // 狀態轉移：首行
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // 狀態轉移：其餘行
    for (1..n + 1) |i| {
        // 狀態轉移：首列
        var leftup = dp[0]; // 暫存 dp[i-1, j-1]
        dp[0] = @intCast(i);
        // 狀態轉移：其餘列
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[j] = leftup;
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
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

    // 暴力搜尋
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("將 {s} 更改為 {s} 最少需要編輯 {} 步\n", .{ s, t, res });

    // 記憶搜尋
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("將 {s} 更改為 {s} 最少需要編輯 {} 步\n", .{ s, t, res });

    // 動態規劃
    res = editDistanceDP(s, t);
    std.debug.print("將 {s} 更改為 {s} 最少需要編輯 {} 步\n", .{ s, t, res });

    // 空間最佳化後的動態規劃
    res = editDistanceDPComp(s, t);
    std.debug.print("將 {s} 更改為 {s} 最少需要編輯 {} 步\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
