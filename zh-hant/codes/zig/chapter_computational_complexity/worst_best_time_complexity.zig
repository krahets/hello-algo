// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // 建立陣列 nums = { 1, 2, 3, ..., n }
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // 隨機打亂陣列元素
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// 在陣列 nums 中尋找數字 1 的索引
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// 主程式
pub fn run() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        const index = findOne(&nums);
        std.debug.print("陣列 [ 1, 2, ..., n ] 打亂順序後 = ", .{});
        std.debug.print("{}\n", .{utils.fmt.slice(nums)});

        std.debug.print("數字 1 的索引為 {}\n", .{index});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "worst_best_time_complexity" {
    run();
}
