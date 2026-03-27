// File: climbing_stairs_dfs_mem.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Поиск с мемоизацией
fn dfs(i: usize, mem: []i32) i32 {
    // dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 or i == 2) {
        return @intCast(i);
    }
    // Если запись dp[i] существует, сразу вернуть ее
    if (mem[i] != -1) {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    var count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Сохранить dp[i]
    mem[i] = count;
    return count;
}

// Подъем по лестнице: поиск с мемоизацией
fn climbingStairsDFSMem(comptime n: usize) i32 {
    // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    var mem = [_]i32{ -1 } ** (n + 1);
    return dfs(n, &mem);
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDFSMem(n);
    std.debug.print("Количество способов подняться по лестнице из {} ступеней: {} вариантов\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
