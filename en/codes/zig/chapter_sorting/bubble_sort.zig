// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Bubble sort
fn bubbleSort(nums: []i32) void {
    // Outer loop: the unsorted range is [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// Bubble sort (flag optimization)
fn bubbleSortWithFlag(nums: []i32) void {
    // Outer loop: the unsorted range is [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // Initialize the flag
        var j: usize = 0;
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // Exit immediately if this pass made no swaps
    }
}

// Driver code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("After bubble sort, nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\nAfter bubble sort, nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    _ = try std.io.getStdIn().reader().readByte();
}

