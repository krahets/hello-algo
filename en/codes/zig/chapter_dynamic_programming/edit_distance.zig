// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Edit distance: brute-force search
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // If both prefixes s[0..i] and t[0..j] are empty, return 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // If the prefix s[0..i] is empty, return the length j of the other prefix
    if (i == 0) {
        return @intCast(j);
    }
    // If the prefix t[0..j] is empty, return the length i of the other prefix
    if (j == 0) {
        return @intCast(i);
    }
    // If the two characters are equal, skip both of them
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return the minimum number of edits
    return @min(@min(insert, delete), replace) + 1;
}

// Edit distance: memoized search
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // If both prefixes s[0..i] and t[0..j] are empty, return 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // If the prefix s[0..i] is empty, return the length j of the other prefix
    if (i == 0) {
        return @intCast(j);
    }
    // If the prefix t[0..j] is empty, return the length i of the other prefix
    if (j == 0) {
        return @intCast(i);
    }
    // If a result has already been recorded, return it directly
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // If the two characters are equal, skip both of them
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Record and return the minimum number of edits
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// Edit distance: dynamic programming
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // State transitions: first row and first column
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // State transitions: remaining rows and columns
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // If the two characters are equal, skip both of them
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// Edit distance: space-optimized dynamic programming
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // State transitions: first row
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // State transitions: remaining rows
    for (1..n + 1) |i| {
        // State transitions: first column
        var leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = @intCast(i);
        // State transitions: remaining columns
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // If the two characters are equal, skip both of them
                dp[j] = leftup;
            } else {
                // Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Update to dp[i-1, j-1] for the next iteration
        }
    }
    return dp[m];
}

// Driver code
pub fn main() !void {
    const s = "bag";
    const t = "pack";
    comptime var n = s.len;
    comptime var m = t.len;

    // Brute-force search
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("Changing {s} to {s} requires at least {} edits\n", .{ s, t, res });

    // Memoized search
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("Changing {s} to {s} requires at least {} edits\n", .{ s, t, res });

    // Dynamic programming
    res = editDistanceDP(s, t);
    std.debug.print("Changing {s} to {s} requires at least {} edits\n", .{ s, t, res });

    // Space-optimized dynamic programming
    res = editDistanceDPComp(s, t);
    std.debug.print("Changing {s} to {s} requires at least {} edits\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
