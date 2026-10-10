// File: climbing_stairs_constraint_dp.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Подъем по лестнице с ограничениями: динамическое программирование
fn climbingStairsConstraintDP(comptime n: usize) i32 {
    if (n == 1 or n == 2) {
        return 1;
    }
    // Инициализация таблицы dp для хранения решений подзадач
    var dp = [_][3]i32{ [_]i32{ -1, -1, -1 } } ** (n + 1);
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (3..n + 1) |i| {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

// Driver Code
pub fn main() !void {
    comptime var n: usize = 9;

    var res = climbingStairsConstraintDP(n);
    std.debug.print("Количество способов подняться по лестнице из {} ступеней: {} вариантов\n", .{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
