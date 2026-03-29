// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 制約付き階段登り：動的計画法
fn climbingStairsConstraintDP(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return 1;
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (3..n + 1) |i| {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsConstraintDP(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
