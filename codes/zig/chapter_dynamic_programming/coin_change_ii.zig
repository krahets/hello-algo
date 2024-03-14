// File: coin_change_ii.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 零钱兑换 II：动态规划
fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // 初始化 dp 表
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // 初始化首列
    for (0..n + 1) |i| {
        dp[i][0] = 1;
    }
    // 状态转移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[n][amt];
}

// 零钱兑换 II：空间优化后的动态规划
fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // 初始化 dp 表
    var dp = [_]i32{0} ** (amt + 1);
    dp[0] = 1;
    // 状态转移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = dp[a] + dp[a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[amt];
}

// Driver Code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 5;

    // 动态规划
    var res = coinChangeIIDP(&coins, amt);
    std.debug.print("凑出目标金额的硬币组合数量为 {}\n", .{res});

    // 空间优化后的动态规划
    res = coinChangeIIDPComp(&coins, amt);
    std.debug.print("凑出目标金额的硬币组合数量为 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
