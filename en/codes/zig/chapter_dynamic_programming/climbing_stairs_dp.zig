// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Climbing stairs: dynamic programming
fn climbingStairsDP(comptime n: usize) i32 {
    // The values of dp[1] and dp[2] are known; return them
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // Initialize the dp table to store subproblem solutions
    var dp = [_]i32{-1} ** (n + 1);
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = 1;
    dp[2] = 2;
    // State transitions: solve progressively larger subproblems using smaller ones
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// Climbing stairs: space-optimized dynamic programming
fn climbingStairsDPComp(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    var a: i32 = 1;
    var b: i32 = 2;
    for (3..n + 1) |_| {
        var tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

// Driver code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDP(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
