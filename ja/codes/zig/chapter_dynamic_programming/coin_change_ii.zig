// File: coin_change_ii.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// コイン両替 II：動的計画法
fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // dp テーブルを初期化
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // 先頭列を初期化する
    for (0..n + 1) |i| {
        dp[i][0] = 1;
    }
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[n][amt];
}

// コイン両替 II：空間最適化した動的計画法
fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // dp テーブルを初期化
    var dp = [_]i32{0} ** (amt + 1);
    dp[0] = 1;
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
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

    // 動的計画法
    var res = coinChangeIIDP(&coins, amt);
    std.debug.print("目標金額を作る硬貨の組合せ数は {}\n", .{res});

    // 空間最適化後の動的計画法
    res = coinChangeIIDPComp(&coins, amt);
    std.debug.print("目標金額を作る硬貨の組合せ数は {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
