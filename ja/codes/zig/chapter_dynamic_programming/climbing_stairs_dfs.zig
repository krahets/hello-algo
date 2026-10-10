// File: climbing_stairs_dfs.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 検索
fn dfs(i: usize) i32 {
    // dp[1] と dp[2] は既知なので返す
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1) + dfs(i - 2);
    return count;
}

// 階段登り：探索
fn climbingStairsDFS(comptime n: usize) i32 {
    return dfs(n);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFS(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
