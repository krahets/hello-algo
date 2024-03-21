// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 爬楼梯最小代价：动态规划
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // 初始化 dp 表，用于存储子问题的解
    var dp = [_]i32{-1} ** (n + 1);
    // 初始状态：预设最小子问题的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状态转移：从较小子问题逐步求解较大子问题
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// 爬楼梯最小代价：空间优化后的动态规划
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // 状态转移：从较小子问题逐步求解较大子问题
    for (3..n + 1) |i| {
        var tmp = b;
        b = @min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

// Driver Code
pub fn main() !void {
    comptime var cost = [_]i32{ 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
    std.debug.print("输入楼梯的代价列表为 {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("输入楼梯的代价列表为 {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("输入楼梯的代价列表为 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
