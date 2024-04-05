// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 帶約束爬樓梯：動態規劃
fn climbingStairsConstraintDP(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return 1;
    }
    // 初始化 dp 表，用於儲存子問題的解
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // 初始狀態：預設最小子問題的解
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 狀態轉移：從較小子問題逐步求解較大子問題
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
    std.debug.print("爬 {} 階樓梯共有 {} 種方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
