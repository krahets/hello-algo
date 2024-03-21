// File: climbing_stairs_dfs_mem.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// 记忆化搜索
fn dfs(i: usize, mem: []i32) i32 {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // 若存在记录 dp[i] ，则直接返回之
    if (mem[i] != -1) {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // 记录 dp[i]
    mem[i] = count;
    return count;
}

// 爬楼梯：记忆化搜索
fn climbingStairsDFSMem(comptime n: usize) i32 {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    var mem = [_]i32{ -1 } ** (n + 1);
    return dfs(n, &mem);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFSMem(n);
    std.debug.print("爬 {} 阶楼梯共有 {} 种方案\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
