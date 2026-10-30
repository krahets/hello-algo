// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// Generate an array containing { 1, 2, ..., n } in shuffled order
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // Randomly shuffle the array elements
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// Find the index of the number 1 in array nums
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // When 1 is at the start of the array, the best-case time complexity is O(1)
        // When 1 is at the end of the array, the worst-case time complexity is O(n)
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// Driver code
pub fn run() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        const index = findOne(&nums);
        std.debug.print("Shuffled array [1, 2, ..., n] = ", .{});
        std.debug.print("{}\n", .{utils.fmt.slice(nums)});

        std.debug.print("Index of 1: {}\n", .{index});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "worst_best_time_complexity" {
    run();
}
