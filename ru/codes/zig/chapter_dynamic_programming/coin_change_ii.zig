// File: coin_change_ii.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Размен монет II: динамическое программирование
fn coinChangeIIDP(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // Инициализация таблицы dp
    var dp = [_][amt + 1]i32{[_]i32{0} ** (amt + 1)} ** (n + 1);
    // Инициализация первого столбца
    for (0..n + 1) |i| {
        dp[i][0] = 1;
    }
    // Переход состояний
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[n][amt];
}

// Размен монет II: динамическое программирование с оптимизацией памяти
fn coinChangeIIDPComp(comptime coins: []i32, comptime amt: usize) i32 {
    comptime var n = coins.len;
    // Инициализация таблицы dp
    var dp = [_]i32{0} ** (amt + 1);
    dp[0] = 1;
    // Переход состояний
    for (1..n + 1) |i| {
        for (1..amt + 1) |a| {
            if (coins[i - 1] > @as(i32, @intCast(a))) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a];
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = dp[a] + dp[a - @as(usize, @intCast(coins[i - 1]))];
            }
        }
    }
    return dp[amt];
}

// Driver Code
pub fn main() !void {
    comptime var coins = [_]i32{ 1, 2, 5 };
    comptime var amt: usize = 5;

    // Динамическое программирование
    var res = coinChangeIIDP(&coins, amt);
    std.debug.print("Количество комбинаций монет для набора целевой суммы = {}\n", .{res});

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeIIDPComp(&coins, amt);
    std.debug.print("Количество комбинаций монет для набора целевой суммы = {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
