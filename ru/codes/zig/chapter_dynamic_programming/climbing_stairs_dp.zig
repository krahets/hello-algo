// File: climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Подъем по лестнице: динамическое программирование
fn climbingStairsDP(comptime n: usize) i32 {
    // dp[1] и dp[2] уже известны, вернуть их
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    // Инициализация таблицы dp для хранения решений подзадач
    var dp = [_]i32{-1} ** (n + 1);
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = 1;
    dp[2] = 2;
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (3..n + 1) |i| {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

// Подъем по лестнице: динамическое программирование с оптимизацией памяти
fn climbingStairsDPComp(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return @intCast(n);
    }
    var a: i32 = 1;
    var b: i32 = 2;
    for (3..n + 1) |_| {
        var tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsDP(n);
    std.debug.print("Количество способов подняться по лестнице из {} ступеней: {} вариантов\n", .{ n, res });

    res = climbingStairsDPComp(n);
    std.debug.print("Количество способов подняться по лестнице из {} ступеней: {} вариантов\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
