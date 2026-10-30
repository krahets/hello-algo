// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Insertion sort
fn insertionSort(nums: []i32) void {
    // Outer loop: the sorted range is [0, i-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // Move nums[j - 1] one position to the right
        }
        nums[j] = base;             // Place base at the correct position
    }
}

// Driver code
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("After insertion sort, nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}