// File: knapsack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Рюкзак 0-1: полный перебор
fn knapsackDFS(wgt: []i32, val: []i32, i: usize, c: usize) i32 {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    var no = knapsackDFS(wgt, val, i - 1, c);
    var yes = knapsackDFS(wgt, val, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // Вернуть вариант с большей стоимостью из двух возможных
    return @max(no, yes);
}

// Рюкзак 0-1: поиск с мемоизацией
fn knapsackDFSMem(wgt: []i32, val: []i32, mem: anytype, i: usize, c: usize) i32 {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i == 0 or c == 0) {
        return 0;
    }
    // Если запись уже существует, вернуть ее напрямую
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    var no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    var yes = knapsackDFSMem(wgt, val, mem, i - 1, c - @as(usize, @intCast(wgt[i - 1]))) + val[i - 1];
    // Сохранить и вернуть более выгодный из двух вариантов
    mem[i][c] = @max(no, yes);
    return mem[i][c];
}

// Рюкзак 0-1: динамическое программирование
fn knapsackDP(comptime wgt: []i32, val: []i32, comptime cap: usize) i32 {
    comptime var n = wgt.len;
    // Инициализировать таблицу dp
    var dp = [_][cap + 1]i32{[_]i32{0} ** (cap + 1)} ** (n + 1);
    // Переход состояния
    for (1..n + 1) |i| {
        for (1..cap + 1) |c| {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[i][c] = dp[i - 1][c];
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[i][c] = @max(dp[i - 1][c], dp[i - 1][c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

// Рюкзак 0-1: динамическое программирование с оптимизацией памяти
fn knapsackDPComp(wgt: []i32, val: []i32, comptime cap: usize) i32 {
    var n = wgt.len;
    // Инициализировать таблицу dp
    var dp = [_]i32{0} ** (cap + 1);
    // Переход состояния
    for (1..n + 1) |i| {
        // Обойти в обратном порядке
        var c = cap;
        while (c > 0) : (c -= 1) {
            if (wgt[i - 1] < c) {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = @max(dp[c], dp[c - @as(usize, @intCast(wgt[i - 1]))] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

// Driver Code
pub fn main() !void {
    comptime var wgt = [_]i32{ 10, 20, 30, 40, 50 };
    comptime var val = [_]i32{ 50, 120, 150, 210, 240 };
    comptime var cap = 50;
    comptime var n = wgt.len;

    // Полный перебор
    var res = knapsackDFS(&wgt, &val, n, cap);
    std.debug.print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {}\n", .{res});

    // Поиск с мемоизацией
    var mem = [_][cap + 1]i32{[_]i32{-1} ** (cap + 1)} ** (n + 1);
    res = knapsackDFSMem(&wgt, &val, @constCast(&mem), n, cap);
    std.debug.print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {}\n", .{res});

    // Динамическое программирование
    res = knapsackDP(&wgt, &val, cap);
    std.debug.print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {}\n", .{res});

    // Динамическое программирование с оптимизацией по памяти
    res = knapsackDPComp(&wgt, &val, cap);
    std.debug.print("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна {}\n", .{res});

    _ = try std.io.getStdIn().reader().readByte();
}
