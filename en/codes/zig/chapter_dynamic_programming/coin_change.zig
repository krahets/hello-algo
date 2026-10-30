// File: coin_change.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Coin change: dynamic programming
fn coinChangeDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // Initialize the dp table
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // State transitions: first row and first column
    for (1..amt + 1) |a| {
        dp[0][a] = max;
    }
    // State transitions: remaining rows and columns
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
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

// Coin change: space-optimized dynamic programming
fn coinChangeDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // Initialize the dp table
    var dp = [_]i32{0} ** (amt + 1);
    @memset(&dp, max);
    dp[0] = 0;
    // State transitions
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
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

// Driver code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 4;

    // Dynamic programming
    var res = coinChangeDP(&coins, amt);
    std.debug.print("Minimum number of coins needed for the target amount: {}\n", .{res});

    // Space-optimized dynamic programming
    res = coinChangeDPComp(&coins, amt);
    std.debug.print("Minimum number of coins needed for the target amount: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
