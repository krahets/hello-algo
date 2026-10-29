// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 階段の上り方：動的計画法
fn climbingStairsDP(comptime n: usize) i32 {
    // dp[1] と dp[2] は既知なので、その値を返す
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    var dp = [_]i32{-1} ** (n + 1);
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// 階段の上り方：空間を最適化した動的計画法
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

// 実行用コード
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDP(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
