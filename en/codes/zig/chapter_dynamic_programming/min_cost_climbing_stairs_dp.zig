// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Minimum cost to climb stairs: dynamic programming
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // Initialize the dp table to store subproblem solutions
    var dp = [_]i32{-1} ** (n + 1);
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = cost[1];
    dp[2] = cost[2];
    // State transitions: solve progressively larger subproblems using smaller ones
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// Minimum cost to climb stairs: space-optimized dynamic programming
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // State transitions: solve progressively larger subproblems using smaller ones
    for (3..n + 1) |i| {
        var tmp = b;
        b = @min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

// Driver code
pub fn main() !void {
    comptime var cost = [_]i32{ 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
    std.debug.print("Input stair costs: {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("Minimum cost to climb the stairs: {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("Minimum cost to climb the stairs: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
