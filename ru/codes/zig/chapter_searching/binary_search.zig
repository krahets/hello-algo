// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Двоичный поиск (замкнутый интервал)
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализировать замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
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

// Двоичный поиск (интервал, замкнутый слева и открытый справа)
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // Инициализация интервала [0, n), замкнутого слева и открытого справа: i указывает на первый элемент массива, а j — на позицию сразу за последним
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

    // Двоичный поиск (замкнутый интервал)
    var index = binarySearch(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    // Двоичный поиск (интервал, замкнутый слева и открытый справа)
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("Индекс целевого элемента 6 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}