// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Сортировка вставками
fn insertionSort(nums: []i32) void {
    // Внешний цикл: отсортированный диапазон [0, i-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // Сдвинуть nums[j] на одну позицию вправо
        }
        nums[j] = base;             // Поместить base в правильную позицию
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("После завершения сортировки вставками nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}