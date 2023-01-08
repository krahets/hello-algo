// File: leetcode_two_sum.zig
// Created Time: 2023-01-07
// Author: sjinzh (sjinzh@gmail.com)

const std = @import("std");
const inc = @import("include");

const SolutionBruteForce = struct {
    pub fn twoSum(self: *SolutionBruteForce, nums: []i32, target: i32) [2]i32 {
        _ = self;
        var size: usize = nums.len;
        var i: usize = 0;
        // 两层循环，时间复杂度 O(n^2)
        while (i < size - 1) : (i += 1) {
            var j = i + 1;
            while (j < size) : (j += 1) {
                if (nums[i] + nums[j] == target) {
                    return [_]i32{@intCast(i32, i), @intCast(i32, j)};
                }
            }
        }
        return undefined;
    }
};

const SolutionHashMap = struct {
    pub fn twoSum(self: *SolutionHashMap, nums: []i32, target: i32) ![2]i32 {
        _ = self;
        var size: usize = nums.len;
        // 辅助哈希表，空间复杂度 O(n)
        var dic = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
        defer dic.deinit();
        var i: usize = 0;
        // 单层循环，时间复杂度 O(n)
        while (i < size) : (i += 1) {
            if (dic.contains(target - nums[i])) {
                return [_]i32{dic.get(target - nums[i]).?, @intCast(i32, i)};
            }
            try dic.put(nums[i], @intCast(i32, i));
        }
        return undefined;
    }
};

// Driver Code
pub fn main() !void {
    // ======= Test Case =======
    var nums = [_]i32{ 2, 7, 11, 15 };
    var target: i32 = 9;
    // 方法一
    var slt1 = SolutionBruteForce{};
    var res = slt1.twoSum(&nums, target);
    std.debug.print("方法一 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 
    // 方法二
    var slt2 = SolutionHashMap{};
    res = try slt2.twoSum(&nums, target);
    std.debug.print("方法二 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 
}

