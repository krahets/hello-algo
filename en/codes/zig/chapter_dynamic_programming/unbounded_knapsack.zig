// File: unbounded_knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Unbounded knapsack: dynamic programming
fn unboundedKnapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // Initialize the dp table
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // State transitions
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = @max(dp[i - 1][c], dp[i][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// Unbounded knapsack: space-optimized dynamic programming
fn unboundedKnapsackDPComp(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // Initialize the dp table
    var dp = [_]i32{0} ** (cap + 1);
    // State transitions
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // If item i exceeds the remaining capacity, do not choose it
                dp[c] = dp[c];
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver code
pub fn main() !void {
    comptime var wgt = [_]i32{ 1, 2, 3 };
    comptime var val = [_]i32{ 5, 11, 15 };
    comptime var cap = 4;

    // Dynamic programming
    var res = unboundedKnapsackDP(&wgt, &val, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    // Space-optimized dynamic programming
    res = unboundedKnapsackDPComp(&wgt, &val, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
