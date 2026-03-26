// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Пузырьковая сортировка
fn bubbleSort(nums: []i32) void {
    // Внешний цикл: неотсортированный диапазон равен [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// Пузырьковая сортировка (оптимизация флагом)
fn bubbleSortWithFlag(nums: []i32) void {
    // Внешний цикл: неотсортированный диапазон равен [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // Инициализировать флаг
        var j: usize = 0;
        // Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // В этом проходе пузырьковой сортировки не было ни одного обмена, поэтому можно сразу выйти
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("Пузырьковая сортировкапосле завершения nums =",.{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\nПузырьковая сортировкапосле завершения nums1 =",.{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    _ = try std.io.getStdIn().reader().readByte();
}

