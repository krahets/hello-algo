// File: knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 0-1 knapsack: brute-force search
fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    var no = knapsackDFS(wgt, val, i - 1, c);
    var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // Return the larger value from the two choices
    return @max(no, yes);
}

// 0-1 knapsack: memoized search
fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
    // If all items have been considered or no capacity remains, return value 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // If a result has already been recorded, return it directly
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // Record and return the larger value from the two choices
    mem[i][c] = @max(no, yes);
    return mem[i][c];
}

// 0-1 knapsack: dynamic programming
fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
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
                dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// 0-1 knapsack: space-optimized dynamic programming
fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
    var n = wgt.len;
    // Initialize the dp table
    var dp = [_]i32{0} ** (cap + 1);
    // State transitions
    for (1..n + 1) |i| {
        // Traverse in decreasing order
        var c = cap;
        while (c > 0) : (c -= 1) {
            if (wgt[i - 1] < c) {
                // Take the larger value obtained by excluding and including item i
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver code
pub fn main() !void {
    comptime var wgt = [_]i32{ 10, 20, 30, 40, 50 };
    comptime var val = [_]i32{ 50, 120, 150, 210, 240 };
    comptime var cap = 50;
    comptime var n = wgt.len;

    // Brute-force search
    var res = knapsackDFS(&wgt, &val, n, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    // Memoized search
    var mem = [_][cap + 1]i32{[_]i32{-1} ** (cap + 1)} ** (n + 1);
    res = knapsackDFSMem(&wgt, &val, @constCast(&mem), n, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    // Dynamic programming
    res = knapsackDP(&wgt, &val, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    // Space-optimized dynamic programming
    res = knapsackDPComp(&wgt, &val, cap);
    std.debug.print("Maximum total item value within the knapsack capacity: {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
