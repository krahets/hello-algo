// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Бинарный поиск (двусторонний закрытый интервал)
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализировать закрытый интервал [0, n-1], где i и j указывают на первый и последний элементы массива
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i > j он пуст)
    while (i <= j) {
        var m = i + (j - i) / 2;                // Вычислить средний индекс m
        if (nums.items[m] < target) {           // Это означает, что target находится в интервале [m+1, j]
            i = m + 1;
        } else if (nums.items[m] > target) {    // Это означает, что target находится в интервале [i, m-1]
            j = m - 1;
        } else {                                // Целевой элемент найден, вернуть его индекс
            return @intCast(m);
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

// Бинарный поиск (левый закрытый, правый открытый интервал)
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализировать интервал [0, n), где i и j указывают на первый элемент массива и позицию за последним элементом
    var i: usize = 0;
    var j: usize = nums.items.len;
    // Выполнять цикл и выйти, когда диапазон поиска станет пустым (при i = j он пуст)
    while (i <= j) {
        var m = i + (j - i) / 2;                // Вычислить средний индекс m
        if (nums.items[m] < target) {           // Это означает, что target находится в интервале [m+1, j)
            i = m + 1;
        } else if (nums.items[m] > target) {    // Это означает, что target находится в интервале [i, m)
            j = m;
        } else {                                // Целевой элемент найден, вернуть его индекс
            return @intCast(m);
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 6;
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 });

    // Бинарный поиск (двусторонний закрытый интервал)
    var index = binarySearch(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    // Бинарный поиск (левый закрытый, правый открытый интервал)
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}
