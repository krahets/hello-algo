// File: climbing_stairs_backtrack.zig
// Created Time: 2023-07-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");

// Бэктрекинг
fn backtrack(choices: []i32, state: i32, n: i32, res: std.ArrayList(i32)) void {
    // Когда подъем достигает n-й ступени, число решений увеличивается на 1
    if (state == n) {
        res.items[0] = res.items[0] + 1;
    }
    // Перебрать все варианты выбора
    for (choices) |choice| {
        // Отсечение: не позволять выходить за пределы n-й ступени
        if (state + choice > n) {
            continue;
        }
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res);
        // Откат
    }
}

// Подъем по лестнице: бэктрекинг
fn climbingStairsBacktrack(n: usize) !i32 {
    var choices = [_]i32{ 1, 2 }; // Можно подняться на 1 или 2 ступени
    var state: i32 = 0; // Начать подъем с 0-й ступени
    var res = std.ArrayList(i32).init(std.heap.page_allocator);
    defer res.deinit();
    try res.append(0); // Использовать res[0] для хранения числа решений
    backtrack(&choices, state, @intCast(n), res);
    return res.items[0];
}

// Driver Code
pub fn main() !void {
    var n: usize = 9;

    var res = try climbingStairsBacktrack(n);
    std.debug.print("Для подъема по лестнице из {} ступеней существует {} способов\n",.{ n, res });

    _ = try std.io.getStdIn().reader().readByte();
}
