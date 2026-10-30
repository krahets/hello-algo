// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Minimum path sum: brute-force search
fn minPathSumDFS(grid: anytype, i: i32, j: i32) i32 {
    // Stop searching at the top-left cell
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, use the maximum i32 value to represent infinite cost
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
    var up = minPathSumDFS(grid, i - 1, j);
    var left = minPathSumDFS(grid, i, j - 1);
    // Return the minimum path cost from the top-left corner to (i, j)
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// Minimum path sum: memoized search
fn minPathSumDFSMem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // Stop searching at the top-left cell
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // If a row or column index is out of bounds, use the maximum i32 value to represent infinite cost
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // If a result has already been recorded, return it directly
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
    var up = minPathSumDFSMem(grid, mem, i - 1, j);
    var left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Return the minimum path cost from the top-left corner to (i, j)
    // Record and return the minimum path cost from the top-left corner to (i, j)
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// Minimum path sum: dynamic programming
fn minPathSumDP(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // Initialize the dp table
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // State transitions: first row
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // State transitions: first column
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // State transitions: remaining rows and columns
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// Minimum path sum: space-optimized dynamic programming
fn minPathSumDPComp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // Initialize the dp table
    var dp = [_]i32{0} ** m;
    // State transitions: first row
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // State transitions: remaining rows
    for (1..n) |i| {
        // State transitions: first column
        dp[0] = dp[0] + grid[i][0];
        for (1..m) |j| {
            dp[j] = @min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

// Driver code
pub fn main() !void {
    comptime var grid = [_][4]i32{
        [_]i32{ 1, 3, 1, 5 },
        [_]i32{ 2, 2, 4, 2 },
        [_]i32{ 5, 3, 2, 1 },
        [_]i32{ 4, 3, 5, 2 },
    };
    comptime var n = grid.len;
    comptime var m = grid[0].len;

    // Brute-force search
    var res = minPathSumDFS(&grid, n - 1, m - 1);
    std.debug.print("Minimum path sum from the top-left to the bottom-right corner: {}\n", .{res});

    // Memoized search
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = minPathSumDFSMem(&grid, &mem, n - 1, m - 1);
    std.debug.print("Minimum path sum from the top-left to the bottom-right corner: {}\n", .{res});

    // Dynamic programming
    res = minPathSumDP(&grid);
    std.debug.print("Minimum path sum from the top-left to the bottom-right corner: {}\n", .{res});

    // Space-optimized dynamic programming
    res = minPathSumDPComp(&grid);
    std.debug.print("Minimum path sum from the top-left to the bottom-right corner: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
