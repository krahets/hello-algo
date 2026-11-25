// File: worst_best_time_complexity.zig
// Created Time: 2022-12-28
// Author: codingonion (coderonion@gmail.com), CreatorMetaSky (creator_meta_sky@163.com)

const std = @import("std");
const utils = @import("utils");

// { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다
pub fn randomNumbers(comptime n: usize) [n]i32 {
    var nums: [n]i32 = undefined;
    // 배열 nums = { 1, 2, 3, ..., n }을 만든다
    for (&nums, 0..) |*num, i| {
        num.* = @as(i32, @intCast(i)) + 1;
    }
    // 배열의 원소를 무작위로 섞는다
    const rand = std.crypto.random;
    rand.shuffle(i32, &nums);
    return nums;
}

// 배열 nums에서 1의 인덱스를 찾는다
pub fn findOne(nums: []i32) i32 {
    for (nums, 0..) |num, i| {
        // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
        // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
        if (num == 1) return @intCast(i);
    }
    return -1;
}

// 실행 예제
pub fn run() void {
    var i: i32 = 0;
    while (i < 10) : (i += 1) {
        const n: usize = 100;
        var nums = randomNumbers(n);
        const index = findOne(&nums);
        std.debug.print("배열 [ 1, 2, ..., n ]을 섞은 결과 = ", .{});
        std.debug.print("{}\n", .{utils.fmt.slice(nums)});

        std.debug.print("숫자 1의 인덱스 = {}\n", .{index});
    }

    std.debug.print("\n", .{});
}

pub fn main() !void {
    run();
}

test "worst_best_time_complexity" {
    run();
}
