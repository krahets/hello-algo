// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 最小路徑和：暴力搜尋
fn minPathSumDFS(grid: anytype, i: i32, j: i32) i32 {
    // 若為左上角單元格，則終止搜尋
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    var up = minPathSumDFS(grid, i - 1, j);
    var left = minPathSumDFS(grid, i, j - 1);
    // 返回從左上角到 (i, j) 的最小路徑代價
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小路徑和：記憶化搜尋
fn minPathSumDFSMem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // 若為左上角單元格，則終止搜尋
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，則返回 +∞ 代價
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 若已有記錄，則直接返回
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
    var up = minPathSumDFSMem(grid, mem, i - 1, j);
    var left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 返回從左上角到 (i, j) 的最小路徑代價
    // 記錄並返回左上角到 (i, j) 的最小路徑代價
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小路徑和：動態規劃
fn minPathSumDP(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // 初始化 dp 表
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // 狀態轉移：首行
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 狀態轉移：首列
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 狀態轉移：其餘行和列
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// 最小路徑和：空間最佳化後的動態規劃
fn minPathSumDPComp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // 初始化 dp 表
    var dp = [_]i32{0} ** m;
    // 狀態轉移：首行
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 狀態轉移：其餘行
    for (1..n) |i| {
        // 狀態轉移：首列
        dp[0] = dp[0] + grid[i][0];
        for (1..m) |j| {
            dp[j] = @min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

// Driver Code
pub fn main() !void {
    comptime var grid = [_][4]i32{
        [_]i32{ 1, 3, 1, 5 },
        [_]i32{ 2, 2, 4, 2 },
        [_]i32{ 5, 3, 2, 1 },
        [_]i32{ 4, 3, 5, 2 },
    };
    comptime var n = grid.len;
    comptime var m = grid[0].len;

    // 暴力搜尋
    var res = minPathSumDFS(&grid, n - 1, m - 1);
    std.debug.print("從左上角到右下角的最小路徑和為 {}\n", .{res});

    // 記憶化搜尋
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = minPathSumDFSMem(&grid, &mem, n - 1, m - 1);
    std.debug.print("從左上角到右下角的最小路徑和為 {}\n", .{res});

    // 動態規劃
    res = minPathSumDP(&grid);
    std.debug.print("從左上角到右下角的最小路徑和為 {}\n", .{res});

    // 空間最佳化後的動態規劃
    res = minPathSumDPComp(&grid);
    std.debug.print("從左上角到右下角的最小路徑和為 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
