// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Создать массив из чисел { 1, 2, ..., n } в случайном порядке
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // Создать массив nums = { 1, 2, 3, ..., n }
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // Случайно перемешать элементы массива
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// Найти индекс числа 1 в массиве nums
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // Если 1 стоит в начале массива, сложность минимальна: O(1)
        // Если 1 стоит в конце массива, сложность максимальна: O(n)
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// Основная программа
pub fn run() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        const index = findOne(&nums);
        std.debug.print("Массив [ 1, 2, ..., n ] после перемешивания = ", .{});
        std.debug.print("{}\n", .{utils.fmt.slice(nums)});

        std.debug.print("Индекс числа 1: {}\n", .{index});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "worst_best_time_complexity" {
    run();
}
