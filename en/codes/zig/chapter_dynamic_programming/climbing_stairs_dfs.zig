// File: climbing_stairs_dfs.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Search
fn dfs(i: usize) i32 {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1) + dfs(i - 2);
    return count;
}

// Climbing stairs: search
fn climbingStairsDFS(comptime n: usize) i32 {
    return dfs(n);
}

// Driver code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFS(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
