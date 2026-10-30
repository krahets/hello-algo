// File: climbing_stairs_dfs_mem.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Memoized search
fn dfs(i: usize, mem: []i32) i32 {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // If dp[i] has been recorded, return it directly
    if (mem[i] != -1) {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

// Climbing stairs: memoized search
fn climbingStairsDFSMem(comptime n: usize) i32 {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
    var mem = [_]i32{ -1 } ** (n + 1);
    return dfs(n, &mem);
}

// Driver code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFSMem(n);
    std.debug.print("Ways to climb {} stairs: {}\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
