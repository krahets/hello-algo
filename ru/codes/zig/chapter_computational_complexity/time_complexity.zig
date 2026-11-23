// File: time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");

// Постоянная сложность
fn constant(n: i32) i32 {
    _ = n;
    var count: i32 = 0;
    const size: i32 = 100_000;
    var i: i32 = 0;
    while (i < size) : (i += 1) {
        count += 1;
    }
    return count;
}

// Линейная сложность
fn linear(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// Линейная сложность (обход массива)
fn arrayTraversal(nums: []i32) i32 {
    var count: i32 = 0;
    // Число итераций пропорционально длине массива
    for (nums) |_| {
        count += 1;
    }
    return count;
}

// Квадратичная сложность
fn quadratic(n: i32) i32 {
    var count: i32 = 0;
    var i: i32 = 0;
    // Число итераций квадратично зависит от размера данных n
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < n) : (j += 1) {
            count += 1;
        }
    }
    return count;
}

// Квадратичная сложность (пузырьковая сортировка)
fn bubbleSort(nums: []i32) i32 {
    var count: i32 = 0; // Счетчик
    // Внешний цикл: неотсортированный диапазон [0, i]
    var i: i32 = @as(i32, @intCast(nums.len)) - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                const tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов включает 3 элементарные операции
            }
        }
    }
    return count;
}

// Экспоненциальная сложность (итеративная реализация)
fn exponential(n: i32) i32 {
    var count: i32 = 0;
    var bas: i32 = 1;
    var i: i32 = 0;
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    while (i < n) : (i += 1) {
        var j: i32 = 0;
        while (j < bas) : (j += 1) {
            count += 1;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

// Экспоненциальная сложность (рекурсивная реализация)
fn expRecur(n: i32) i32 {
    if (n == 1) return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

// Логарифмическая сложность (итеративная реализация)
fn logarithmic(n: i32) i32 {
    var count: i32 = 0;
    var n_var: i32 = n;
    while (n_var > 1) : (n_var = @divTrunc(n_var, 2)) {
        count += 1;
    }
    return count;
}

// Логарифмическая сложность (рекурсивная реализация)
fn logRecur(n: i32) i32 {
    if (n <= 1) return 0;
    return logRecur(@divTrunc(n, 2)) + 1;
}

// Линейно-логарифмическая сложность
fn linearLogRecur(n: i32) i32 {
    if (n <= 1) return 1;
    var count: i32 = linearLogRecur(@divTrunc(n, 2)) + linearLogRecur(@divTrunc(n, 2));
    var i: i32 = 0;
    while (i < n) : (i += 1) {
        count += 1;
    }
    return count;
}

// Факториальная сложность (рекурсивная реализация)
fn factorialRecur(n: i32) i32 {
    if (n == 0) return 1;
    var count: i32 = 0;
    var i: i32 = 0;
    // Из одного получается n
    while (i < n) : (i += 1) {
        count += factorialRecur(n - 1);
    }
    return count;
}

// Driver Code
pub fn run() void {
    // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
    const n: i32 = 8;
    std.debug.print("Размер входных данных n = {}\n", .{n});

    var count = constant(n);
    std.debug.print("Число операций постоянной сложности = {}\n", .{count});

    count = linear(n);
    std.debug.print("Число операций линейной сложности = {}\n", .{count});
    var nums = [_]i32{0} ** n;
    count = arrayTraversal(&nums);
    std.debug.print("Число операций линейной сложности (обход массива) = {}\n", .{count});

    count = quadratic(n);
    std.debug.print("Число операций квадратичной сложности = {}\n", .{count});
    for (&nums, 0..) |*num, i| {
        num.* = n - @as(i32, @intCast(i)); // [n,n-1,...,2,1]
    }
    count = bubbleSort(&nums);
    std.debug.print("Число операций квадратичной сложности (пузырьковая сортировка) = {}\n", .{count});

    count = exponential(n);
    std.debug.print("Число операций экспоненциальной сложности (итеративная реализация) = {}\n", .{count});
    count = expRecur(n);
    std.debug.print("Число операций экспоненциальной сложности (рекурсивная реализация) = {}\n", .{count});

    count = logarithmic(n);
    std.debug.print("Число операций логарифмической сложности (итеративная реализация) = {}\n", .{count});
    count = logRecur(n);
    std.debug.print("Число операций логарифмической сложности (рекурсивная реализация) = {}\n", .{count});

    count = linearLogRecur(n);
    std.debug.print("Число операций линейно-логарифмической сложности (рекурсивная реализация) = {}\n", .{count});

    count = factorialRecur(n);
    std.debug.print("Число операций факториальной сложности (рекурсивная реализация) = {}\n", .{count});

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "time_complexity" {
    run();
}
