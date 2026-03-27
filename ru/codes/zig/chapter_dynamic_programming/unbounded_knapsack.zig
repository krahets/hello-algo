// File: unbounded_knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Полный рюкзак: динамическое программирование
fn unboundedKnapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // Инициализация таблицы dp
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // Переход состояний
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = @max(dp[i - 1][c], dp[i][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// Полный рюкзак: динамическое программирование с оптимизацией памяти
fn unboundedKnapsackDPComp(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // Инициализация таблицы dp
    var dp = [_]i32{0} ** (cap + 1);
    // Переход состояний
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c];
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver Code
pub fn main() !void {
    comptime var wgt = [_]i32{ 1, 2, 3 };
    comptime var val = [_]i32{ 5, 11, 15 };
    comptime var cap = 4;

    // Динамическое программирование
    var res = unboundedKnapsackDP(&wgt, &val, cap);
    std.debug.print("Максимальная стоимость предметов без превышения вместимости рюкзака = {}\n", .{res});

    // Динамическое программирование с оптимизацией памяти
    res = unboundedKnapsackDPComp(&wgt, &val, cap);
    std.debug.print("Максимальная стоимость предметов без превышения вместимости рюкзака = {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
