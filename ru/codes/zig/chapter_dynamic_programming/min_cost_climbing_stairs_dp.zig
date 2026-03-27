// File: min_cost_climbing_stairs_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Минимальная стоимость подъема по лестнице: динамическое программирование
fn minCostClimbingStairsDP(comptime cost: []i32) i32 {
    comptime var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    // Инициализация таблицы dp для хранения решений подзадач
    var dp = [_]i32{-1} ** (n + 1);
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = cost[1];
    dp[2] = cost[2];
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (3..n + 1) |i| {
        dp[i] = @min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

// Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти
fn minCostClimbingStairsDPComp(cost: []i32) i32 {
    var n = cost.len - 1;
    if (n == 1 or n == 2) {
        return cost[n];
    }
    var a = cost[1];
    var b = cost[2];
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (3..n + 1) |i| {
        var tmp = b;
        b = @min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

// Driver Code
pub fn main() !void {
    comptime var cost = [_]i32{ 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
    std.debug.print("Стоимость подъема по ступеням = {any}\n", .{cost});

    var res = minCostClimbingStairsDP(&cost);
    std.debug.print("Стоимость подъема по ступеням = {}\n", .{res});

    res = minCostClimbingStairsDPComp(&cost);
    std.debug.print("Стоимость подъема по ступеням = {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
