// File: coin_change.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 零钱兑换：动态规划
fn coinChangeDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // 初始化 dp 表
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // 状态转移：首行首列
    for (1..amt + 1) |a| {
        dp[0][a] = max;
    }
    // 状态转移：其余行和列
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = @min(dp[i - 1][a], dp[i][a - @as(usize, @intCast(coins[i - 1]))] + 1);
            }
        }
    }
    if (dp[n][amt] != max) {
        return @intCast(dp[n][amt]);
    } else {
        return -1;
    }
}

// 零钱兑换：空间优化后的动态规划
fn coinChangeDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // 初始化 dp 表
    var dp = [_]i32{0} ** (amt + 1);
    @memset(&dp, max);
    dp[0] = 0;
    // 状态转移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = @min(dp[a], dp[a - @as(usize, @intCast(coins[i - 1]))] + 1);
            }
        }
    }
    if (dp[amt] != max) {
        return @intCast(dp[amt]);
    } else {
        return -1;
    }
}

// Driver Code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 4;

    // 动态规划
    var res = coinChangeDP(&coins, amt);
    std.debug.print("凑到目标金额所需的最少硬币数量为 {}\n", .{res});

    // 空间优化后的动态规划
    res = coinChangeDPComp(&coins, amt);
    std.debug.print("凑到目标金额所需的最少硬币数量为 {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
