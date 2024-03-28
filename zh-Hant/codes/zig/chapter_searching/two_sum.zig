// File: two_sum.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 方法一：暴力列舉
pub fn twoSumBruteForce(nums: []i32, target: i32) ?[2]i32 {
    var size: usize = nums.len;
    var i: usize = 0;
    // 兩層迴圈，時間複雜度為 O(n^2)
    while (i < size - 1) : (i += 1) {
        var j = i + 1;
        while (j < size) : (j += 1) {
            if (nums[i] + nums[j] == target) {
                return [_]i32{@intCast(i), @intCast(j)};
            }
        }
    }
    return null;
}

// 方法二：輔助雜湊表
pub fn twoSumHashTable(nums: []i32, target: i32) !?[2]i32 {
    var size: usize = nums.len;
    // 輔助雜湊表，空間複雜度為 O(n)
    var dic = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer dic.deinit();
    var i: usize = 0;
    // 單層迴圈，時間複雜度為 O(n)
    while (i < size) : (i += 1) {
        if (dic.contains(target - nums[i])) {
            return [_]i32{dic.get(target - nums[i]).?, @intCast(i)};
        }
        try dic.put(nums[i], @intCast(i));
    }
    return null;
}


pub fn main() !void {
    // ======= Test Case =======
    var nums = [_]i32{ 2, 7, 11, 15 };
    var target: i32 = 9;

    // ====== Driver Code ======
    // 方法一
    var res = twoSumBruteForce(&nums, target).?;
    std.debug.print("方法一 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 
    // 方法二
    res = (try twoSumHashTable(&nums, target)).?;
    std.debug.print("\n方法二 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 

    _ = try std.io.getStdIn().reader().readByte();
}
