// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二分查找（双闭区间）
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 计算中点索引 m
        if (nums.items[m] < target) {           // 此情况说明 target 在区间 [m+1, j] 中
            i = m + 1;
        } else if (nums.items[m] > target) {    // 此情况说明 target 在区间 [i, m-1] 中
            j = m - 1;
        } else {                                // 找到目标元素，返回其索引
            return @intCast(m);
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

// 二分查找（左闭右开区间）
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
    var i: usize = 0;
    var j: usize = nums.items.len;
    // 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 计算中点索引 m
        if (nums.items[m] < target) {           // 此情况说明 target 在区间 [m+1, j) 中
            i = m + 1;
        } else if (nums.items[m] > target) {    // 此情况说明 target 在区间 [i, m) 中
            j = m;
        } else {                                // 找到目标元素，返回其索引
            return @intCast(m);
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 6;
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 });

    // 二分查找（双闭区间）
    var index = binarySearch(i32, nums, target);
    std.debug.print("目标元素 6 的索引 = {}\n", .{index});

    // 二分查找（左闭右开区间）
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("目标元素 6 的索引 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}