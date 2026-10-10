// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Бинарный поиск (двусторонне замкнутый интервал)
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализировать двусторонне замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // Цикл завершается, когда диапазон поиска пуст (при i > j диапазон пуст)
    while (i <= j) {
        var m = i + (j - i) / 2;                // Вычислить индекс середины m
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

// Бинарный поиск (лево замкнутый, право открытый интервал)
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализировать лево замкнутый, право открытый интервал [0, n), то есть i и j указывают на первый элемент массива и позицию сразу за последним элементом соответственно
    var i: usize = 0;
    var j: usize = nums.items.len;
    // Цикл завершается, когда диапазон поиска пуст (при i = j диапазон пуст)
    while (i <= j) {
        var m = i + (j - i) / 2;                // Вычислить индекс середины m
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

    // Бинарный поиск (двусторонне замкнутый интервал)
    var index = binarySearch(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    // Бинарный поиск (лево замкнутый, право открытый интервал)
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}