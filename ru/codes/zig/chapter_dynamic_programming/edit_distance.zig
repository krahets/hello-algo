// File: edit_distance.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Редакционное расстояние: полный перебор
fn editDistanceDFS(comptime s: []const u8, comptime t: []const u8, i: usize, j: usize) i32 {
    // Если s и t пусты, вернуть 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // Если s пусто, вернуть длину t
    if (i == 0) {
        return @intCast(j);
    }
    // Если t пусто, вернуть длину s
    if (j == 0) {
        return @intCast(i);
    }
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFS(s, t, i - 1, j - 1);
    }
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    var insert = editDistanceDFS(s, t, i, j - 1);
    var delete = editDistanceDFS(s, t, i - 1, j);
    var replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Вернуть минимальное число шагов редактирования
    return @min(@min(insert, delete), replace) + 1;
}

// Редакционное расстояние: поиск с мемоизацией
fn editDistanceDFSMem(comptime s: []const u8, comptime t: []const u8, mem: anytype, i: usize, j: usize) i32 {
    // Если s и t пусты, вернуть 0
    if (i == 0 and j == 0) {
        return 0;
    }
    // Если s пусто, вернуть длину t
    if (i == 0) {
        return @intCast(j);
    }
    // Если t пусто, вернуть длину s
    if (j == 0) {
        return @intCast(i);
    }
    // Если запись уже есть, сразу вернуть ее
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1]) {
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    }
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    var insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    var delete = editDistanceDFSMem(s, t, mem, i - 1, j);
    var replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число шагов редактирования
    mem[i][j] = @min(@min(insert, delete), replace) + 1;
    return mem[i][j];
}

// Редакционное расстояние: динамическое программирование
fn editDistanceDP(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_][m + 1]i32{[_]i32{0} ** (m + 1)} ** (n + 1);
    // Переход состояний: первая строка и первый столбец
    for (1..n + 1) |i| {
        dp[i][0] = @intCast(i);
    }
    for (1..m + 1) |j| {
        dp[0][j] = @intCast(j);
    }
    // Переход состояний: остальные строки и столбцы
    for (1..n + 1) |i| {
        for (1..m + 1) |j| {
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[i][j] = @min(@min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

// Редакционное расстояние: динамическое программирование с оптимизацией памяти
fn editDistanceDPComp(comptime s: []const u8, comptime t: []const u8) i32 {
    comptime var n = s.len;
    comptime var m = t.len;
    var dp = [_]i32{0} ** (m + 1);
    // Переход состояний: первая строка
    for (1..m + 1) |j| {
        dp[j] = @intCast(j);
    }
    // Переход состояний: остальные строки
    for (1..n + 1) |i| {
        // Переход состояний: первый столбец
        var leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = @intCast(i);
        // Переход состояний: остальные столбцы
        for (1..m + 1) |j| {
            var temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[j] = leftup;
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[j] = @min(@min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    return dp[m];
}

// Driver Code
pub fn main() !void {
    const s = "bag";
    const t = "pack";
    comptime var n = s.len;
    comptime var m = t.len;

    // Полный перебор
    var res = editDistanceDFS(s, t, n, m);
    std.debug.print("Чтобы преобразовать {s} в {s}, нужно минимум {} шагов\n", .{ s, t, res });

    // Поиск с запоминанием
    var mem = [_][m + 1]i32{[_]i32{-1} ** (m + 1)} ** (n + 1);
    res = editDistanceDFSMem(s, t, @constCast(&mem), n, m);
    std.debug.print("Чтобы преобразовать {s} в {s}, нужно минимум {} шагов\n", .{ s, t, res });

    // Динамическое программирование
    res = editDistanceDP(s, t);
    std.debug.print("Чтобы преобразовать {s} в {s}, нужно минимум {} шагов\n", .{ s, t, res });

    // Динамическое программирование с оптимизацией памяти
    res = editDistanceDPComp(s, t);
    std.debug.print("Чтобы преобразовать {s} в {s}, нужно минимум {} шагов\n", .{ s, t, res });

    _ = try std.io.getStdIn().reader().readByte();
}
