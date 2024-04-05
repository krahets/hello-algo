// File: binary_search.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 二分搜尋（雙閉區間）
fn binarySearch(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
    var i: usize = 0;
    var j: usize = nums.items.len - 1;
    // 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 計算中點索引 m
        if (nums.items[m] < target) {           // 此情況說明 target 在區間 [m+1, j] 中
            i = m + 1;
        } else if (nums.items[m] > target) {    // 此情況說明 target 在區間 [i, m-1] 中
            j = m - 1;
        } else {                                // 找到目標元素，返回其索引
            return @intCast(m);
        }
    }
    // 未找到目標元素，返回 -1
    return -1;
}

// 二分搜尋（左閉右開區間）
fn binarySearchLCRO(comptime T: type, nums: std.ArrayList(T), target: T) T {
    // 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
    var i: usize = 0;
    var j: usize = nums.items.len;
    // 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
    while (i <= j) {
        var m = i + (j - i) / 2;                // 計算中點索引 m
        if (nums.items[m] < target) {           // 此情況說明 target 在區間 [m+1, j) 中
            i = m + 1;
        } else if (nums.items[m] > target) {    // 此情況說明 target 在區間 [i, m) 中
            j = m;
        } else {                                // 找到目標元素，返回其索引
            return @intCast(m);
        }
    }
    // 未找到目標元素，返回 -1
    return -1;
}

// Driver Code
pub fn main() !void {
    var target: i32 = 6;
    var nums = std.ArrayList(i32).init(std.heap.page_allocator);
    defer nums.deinit();
    try nums.appendSlice(&[_]i32{ 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 });

    // 二分搜尋（雙閉區間）
    var index = binarySearch(i32, nums, target);
    std.debug.print("目標元素 6 的索引 = {}\n", .{index});

    // 二分搜尋（左閉右開區間）
    index = binarySearchLCRO(i32, nums, target);
    std.debug.print("目標元素 6 的索引 = {}\n", .{index});

    _ = try std.io.getStdIn().reader().readByte();
}