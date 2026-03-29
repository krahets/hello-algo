// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 最小経路和：全探索
fn minPathSumDFS(grid: anytype, i: i32, j: i32) i32 {
    // 左上のセルなら探索を終了する
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    var up = minPathSumDFS(grid, i - 1, j);
    var left = minPathSumDFS(grid, i, j - 1);
    // 左上隅から (i, j) までの最小経路コストを返す
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小経路和：メモ化探索
fn minPathSumDFSMem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // 左上のセルなら探索を終了する
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // 行または列のインデックスが範囲外なら、コスト +∞ を返す
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // 既に記録があればそのまま返す
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
    var up = minPathSumDFSMem(grid, mem, i - 1, j);
    var left = minPathSumDFSMem(grid, mem, i, j - 1);
    // 左上隅から (i, j) までの最小経路コストを返す
    // 左上隅から (i, j) までの最小経路コストを記録して返す
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// 最小経路和：動的計画法
fn minPathSumDP(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // dp テーブルを初期化
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // 状態遷移：先頭行
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 状態遷移：先頭列
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 状態遷移: 残りの行と列
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// 最小経路和：空間最適化後の動的計画法
fn minPathSumDPComp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // dp テーブルを初期化
    var dp = [_]i32{0} ** m;
    // 状態遷移：先頭行
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 状態遷移：残りの行
    for (1..n) |i| {
        // 状態遷移：先頭列
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

    // 全探索
    var res = minPathSumDFS(&grid, n - 1, m - 1);
    std.debug.print("左上から右下までの最小経路和は {}\n", .{res});

    // メモ化探索
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = minPathSumDFSMem(&grid, &mem, n - 1, m - 1);
    std.debug.print("左上から右下までの最小経路和は {}\n", .{res});

    // 動的計画法
    res = minPathSumDP(&grid);
    std.debug.print("左上から右下までの最小経路和は {}\n", .{res});

    // 空間最適化後の動的計画法
    res = minPathSumDPComp(&grid);
    std.debug.print("左上から右下までの最小経路和は {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
