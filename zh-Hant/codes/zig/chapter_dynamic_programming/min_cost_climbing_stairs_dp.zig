// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 爬樓梯最小代價：動態規劃
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // 初始化 dp 表，用於儲存子問題的解
    var dp = [_]i32{-1} ** (n + 1);
    // 初始狀態：預設最小子問題的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// 爬樓梯最小代價：空間最佳化後的動態規劃
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // 狀態轉移：從較小子問題逐步求解較大子問題
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
    std.debug.print("輸入樓梯的代價串列為 {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("輸入樓梯的代價串列為 {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("輸入樓梯的代價串列為 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
