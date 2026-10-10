// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 階段登りの最小コスト：動的計画法
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = [_]i32{-1} ** (n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// 階段昇りの最小コスト：空間最適化後の動的計画法
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
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
    std.debug.print("入力された階段のコストのリストは {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("入力された階段のコストのリストは {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("入力された階段のコストのリストは {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
