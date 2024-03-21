// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 插入排序
fn insertionSort(nums: []i32) void {
    // 外循环：已排序区间为 [0, i-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // 将 nums[j] 向右移动一位
        }
        nums[j] = base;             // 将 base 赋值到正确位置
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("插入排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}