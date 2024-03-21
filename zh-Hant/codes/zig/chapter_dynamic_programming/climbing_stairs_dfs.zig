// File: climbing_stairs_dfs.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 搜索
fn dfs(i: usize) i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1) + dfs(i - 2);
    return count;
}

// 爬楼梯：搜索
fn climbingStairsDFS(comptime n: usize) i32 {
    return dfs(n);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFS(n);
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
