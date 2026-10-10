// File: min_path_sum.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Минимальная сумма пути: полный перебор
fn minPathSumDFS(grid: anytype, i: i32, j: i32) i32 {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    var up = minPathSumDFS(grid, i - 1, j);
    var left = minPathSumDFS(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// Минимальная сумма пути: поиск с мемоизацией
fn minPathSumDFSMem(grid: anytype, mem: anytype, i: i32, j: i32) i32 {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 and j == 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 or j < 0) {
        return std.math.maxInt(i32);
    }
    // Если запись уже есть, вернуть сразу
    if (mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] != -1) {
        return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    var up = minPathSumDFSMem(grid, mem, i - 1, j);
    var left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Вернуть минимальную стоимость пути из левого верхнего угла в (i, j)
    // Записать и вернуть минимальную стоимость пути из левого верхнего угла в (i, j)
    mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))] = @min(left, up) + grid[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
    return mem[@as(usize, @intCast(i))][@as(usize, @intCast(j))];
}

// Минимальная сумма пути: динамическое программирование
fn minPathSumDP(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // Инициализация таблицы dp
    var dp = [_][m]i32{[_]i32{0} ** m} ** n;
    dp[0][0] = grid[0][0];
    // Переход состояний: первая строка
    for (1..m) |j| {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход состояний: первый столбец
    for (1..n) |i| {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход состояний: остальные строки и столбцы
    for (1..n) |i| {
        for (1..m) |j| {
            dp[i][j] = @min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

// Минимальная сумма пути: динамическое программирование с оптимизацией памяти
fn minPathSumDPComp(comptime grid: anytype) i32 {
    comptime var n = grid.len;
    comptime var m = grid[0].len;
    // Инициализация таблицы dp
    var dp = [_]i32{0} ** m;
    // Переход состояний: первая строка
    dp[0] = grid[0][0];
    for (1..m) |j| {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход состояний: остальные строки
    for (1..n) |i| {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0];
        for (1..m) |j| {
            dp[j] = @min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

// Driver Code
pub fn main() !void {
    comptime var grid = [_][4]i32{
        [_]i32{ 1, 3, 1, 5 },
        [_]i32{ 2, 2, 4, 2 },
        [_]i32{ 5, 3, 2, 1 },
        [_]i32{ 4, 3, 5, 2 },
    };
    comptime var n = grid.len;
    comptime var m = grid[0].len;

    // Полный перебор
    var res = minPathSumDFS(&grid, n - 1, m - 1);
    std.debug.print("Минимальная сумма пути из левого верхнего угла в правый нижний = {}\n", .{res});

    // Поиск с мемоизацией
    var mem = [_][m]i32{[_]i32{-1} ** m} ** n;
    res = minPathSumDFSMem(&grid, &mem, n - 1, m - 1);
    std.debug.print("Минимальная сумма пути из левого верхнего угла в правый нижний = {}\n", .{res});

    // Динамическое программирование
    res = minPathSumDP(&grid);
    std.debug.print("Минимальная сумма пути из левого верхнего угла в правый нижний = {}\n", .{res});

    // Динамическое программирование с оптимизацией памяти
    res = minPathSumDPComp(&grid);
    std.debug.print("Минимальная сумма пути из левого верхнего угла в правый нижний = {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
