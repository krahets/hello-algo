// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // 配列要素をランダムにシャッフル
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// 配列 nums 内で数値 1 のインデックスを探す
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// Driver Code
pub fn run() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        const index = findOne(&nums);
        std.debug.print("配列 [ 1, 2, ..., n ] をシャッフルした後 = ", .{});
        std.debug.print("{}\n", .{utils.fmt.slice(nums)});

        std.debug.print("数字 1 のインデックスは {}\n", .{index});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "worst_best_time_complexity" {
    run();
}
