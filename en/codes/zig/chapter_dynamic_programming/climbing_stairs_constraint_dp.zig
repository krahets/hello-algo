// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Climbing stairs with constraints: dynamic programming
fn climbingStairsConstraintDP(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return 1;
    }
    // Initialize the dp table to store subproblem solutions
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // Initial states: set the solutions to the smallest subproblems
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transitions: solve progressively larger subproblems using smaller ones
    for (3..n + 1) |i| {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

// Driver code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsConstraintDP(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
