// File: coin_change.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// コイン両替：動的計画法
fn coinChangeDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // dp テーブルを初期化
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // 状態遷移：先頭行と先頭列
    for (1..amt + 1) |a| {
        dp[0][a] = max;
    }
    // 状態遷移: 残りの行と列
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
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

// コイン交換：空間最適化後の動的計画法
fn coinChangeDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // dp テーブルを初期化
    var dp = [_]i32{0} ** (amt + 1);
    @memset(&dp, max);
    dp[0] = 0;
    // 状態遷移
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
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

    // 動的計画法
    var res = coinChangeDP(&coins, amt);
    std.debug.print("目標金額にするために必要な最小の硬貨枚数は {}\n", .{res});

    // 空間最適化後の動的計画法
    res = coinChangeDPComp(&coins, amt);
    std.debug.print("目標金額にするために必要な最小の硬貨枚数は {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
