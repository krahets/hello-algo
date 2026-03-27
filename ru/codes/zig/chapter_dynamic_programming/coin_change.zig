// File: coin_change.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Размен монет: динамическое программирование
fn coinChangeDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // Инициализация таблицы dp
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // Переход состояний: первая строка и первый столбец
    for (1..amt + 1) |a| {
        dp[0][a] = max;
    }
    // Переход состояний: остальные строки и столбцы
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = @min(dp[i - 1][a], dp[i][a - @as(usize, @intCast(coins[i - 1]))] + 1);
            }
        }
    }
    if (dp[n][amt] != max) {
        return @intCast(dp[n][amt]);
    } else {
        return -1;
    }
}

// Размен монет: динамическое программирование с оптимизацией памяти
fn coinChangeDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    comptime var max = amt + 1;
    // Инициализация таблицы dp
    var dp = [_]i32{0} ** (amt + 1);
    @memset(&dp, max);
    dp[0] = 0;
    // Переход состояний
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = @min(dp[a], dp[a - @as(usize, @intCast(coins[i - 1]))] + 1);
            }
        }
    }
    if (dp[amt] != max) {
        return @intCast(dp[amt]);
    } else {
        return -1;
    }
}

// Driver Code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 4;

    // Динамическое программирование
    var res = coinChangeDP(&coins, amt);
    std.debug.print("Минимальное число монет для набора целевой суммы = {}\n", .{res});

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeDPComp(&coins, amt);
    std.debug.print("Минимальное число монет для набора целевой суммы = {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
