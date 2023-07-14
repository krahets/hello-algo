// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");

// 最小路径和：暴力搜索
fn min_path_sum_dfs(grid: anytype, i: i32, j: i32) i32 {
    // 若为左上角单元格，则终止搜索
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    var left = min_path_sum_dfs(grid, i - 1, j);
    var up = min_path_sum_dfs(grid, i, j - 1);
    // 返回从左上角到 (i, j) 的最小路径代价
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小路径和：记忆化搜索
fn min_path_sum_dfs_mem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // 若为左上角单元格，则终止搜索
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 若行列索引越界，则返回 +∞ 代价
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 若已有记录，则直接返回
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
    var left = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    var up = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // 返回从左上角到 (i, j) 的最小路径代价
    // 记录并返回左上角到 (i, j) 的最小路径代价
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小路径和：动态规划
fn min_path_sum_dp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // 初始化 dp 表
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // 状态转移：首行
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状态转移：首列
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状态转移：其余行列
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// 最小路径和：状态压缩后的动态规划
fn min_path_sum_dp_comp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // 初始化 dp 表
    var dp = [_]i32{0} ** m;
    // 状态转移：首行
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状态转移：其余行
    for (1..n) |i| {
        // 状态转移：首列
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

    // 暴力搜索
    var res = min_path_sum_dfs(&grid, n - 1, m - 1);
    std.debug.print("从左上角到右下角的最小路径和为 {}\n", .{res});

    // 记忆化搜索
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = min_path_sum_dfs_mem(&grid, &mem, n - 1, m - 1);
    std.debug.print("从左上角到右下角的最小路径和为 {}\n", .{res});

    // 动态规划
    res = min_path_sum_dp(&grid);
    std.debug.print("从左上角到右下角的最小路径和为 {}\n", .{res});

    // 状态压缩后的动态规划
    res = min_path_sum_dp_comp(&grid);
    std.debug.print("从左上角到右下角的最小路径和为 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
