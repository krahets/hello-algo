// File: coin_change_ii.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Coin change II: dynamic programming
fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // Initialize the dp table
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // Initialize the first column
    for (0..n + 1) |i| {
        dp[i][0] = 1;
    }
    // State transitions
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Add the counts for excluding coin i and including coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[n][amt];
}

// Coin change II: space-optimized dynamic programming
fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // Initialize the dp table
    var dp = [_]i32{0} ** (amt + 1);
    dp[0] = 1;
    // State transitions
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Add the counts for excluding coin i and including coin i
                dp[a] = dp[a] + dp[a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[amt];
}

// Driver code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 5;

    // Dynamic programming
    var res = coinChangeIIDP(&coins, amt);
    std.debug.print("Number of coin combinations for the target amount: {}\n", .{res});

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(&coins, amt);
    std.debug.print("Number of coin combinations for the target amount: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
