// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // 隨機打亂陣列元素
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// 查詢陣列 nums 中數字 1 所在索引
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn main() !void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        var index = findOne(&nums);
        std.debug.print("\n陣列 [ 1, 2, ..., n ] 被打亂後 = ", .{});
        inc.PrintUtil.printArray(i32, &nums);
        std.debug.print("數字 1 的索引為 {}\n", .{index});
    }

    _ = try std.io.getStdIn().reader().readByte();
}

