// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 泡沫排序
fn bubbleSort(nums: []i32) void {
    // 外迴圈：未排序區間為 [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// 泡沫排序（標誌最佳化）
fn bubbleSortWithFlag(nums: []i32) void {
    // 外迴圈：未排序區間為 [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // 初始化標誌位
        var j: usize = 0;
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // 此輪“冒泡”未交換任何元素，直接跳出
    }
}

// Driver Code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("泡沫排序完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\n泡沫排序完成後 nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    _ = try std.io.getStdIn().reader().readByte();
}

