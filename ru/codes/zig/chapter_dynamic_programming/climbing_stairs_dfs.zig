// File: climbing_stairs_dfs.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Поиск
fn dfs(i: usize) i32 {
    // Если значения dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1) + dfs(i - 2);
    return count;
}

// Подъем по лестнице: поиск
fn climbingStairsDFS(comptime n: usize) i32 {
    return dfs(n);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFS(n);
    std.debug.print("Для подъема по лестнице из {} ступеней существует {} способов\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
