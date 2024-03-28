// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 插入排序
fn insertionSort(nums: []i32) void {
    // 外迴圈：已排序區間為 [0, i-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // 將 nums[j] 向右移動一位
        }
        nums[j] = base;             // 將 base 賦值到正確位置
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("插入排序完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}