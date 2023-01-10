// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

// 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (nums) |*num, i| {
        num.* = @intCast(i32, i) + 1;
    }
    // 随机打乱数组元素
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// 查找数组 nums 中数字 1 所在索引
pub fn findOne(nums: []i32) i32 {
    for (nums) |num, i| {
        if (num == 1) return @intCast(i32, i);
    }
    return -1;
}

// Driver Code
pub fn main() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        var index = findOne(&nums);
        std.debug.print("\n数组 [ 1, 2, ..., n ] 被打乱后 = ", .{});
        inc.PrintUtil.printArray(i32, &nums);
        std.debug.print("数字 1 的索引为 {}\n", .{index});
    }
}

