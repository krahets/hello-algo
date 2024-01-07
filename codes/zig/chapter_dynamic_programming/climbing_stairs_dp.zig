// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 爬楼梯：动态规划
fn climbingStairsDP(comptime n: usize) i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // 初始化 dp 表，用于存储子问题的解
    var dp = [_]i32{-1} ** (n + 1);
    // 初始状态：预设最小子问题的解
    dp[1] = 1;
    dp[2] = 2;
    // 状态转移：从较小子问题逐步求解较大子问题
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// 爬楼梯：空间优化后的动态规划
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
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
