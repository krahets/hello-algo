// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 階段登り：動的計画法
fn climbingStairsDP(comptime n: usize) i32 {
    // dp[1] と dp[2] は既知なので返す
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = [_]i32{-1} ** (n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// 階段登り：空間最適化した動的計画法
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

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDP(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
