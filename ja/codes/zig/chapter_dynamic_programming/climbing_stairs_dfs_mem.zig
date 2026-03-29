// File: climbing_stairs_dfs_mem.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// メモ化探索
fn dfs(i: usize, mem: []i32) i32 {
    // dp[1] と dp[2] は既知なので返す
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] の記録があれば、それをそのまま返す
    if (mem[i] != -1) {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] を記録する
    mem[i] = count;
    return count;
}

// 階段登り：メモ化探索
fn climbingStairsDFSMem(comptime n: usize) i32 {
    // mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
    var mem = [_]i32{ -1 } ** (n + 1);
    return dfs(n, &mem);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFSMem(n);
    std.debug.print("{} 段の階段を上る方法は全部で {} 通り\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
