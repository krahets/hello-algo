// File: two_sum.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// Метод 1: полный перебор
pub fn twoSumBruteForce(nums: []i32, target: i32) ?[2]i32 {
    var size: usize = nums.len;
    var i: usize = 0;
    // Два вложенных цикла, временная сложность O(n^2)
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

// Метод 2: вспомогательная хеш-таблица
pub fn twoSumHashTable(nums: []i32, target: i32) !?[2]i32 {
    var size: usize = nums.len;
    // Вспомогательная хеш-таблица, пространственная сложность O(n)
    var dic = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer dic.deinit();
    var i: usize = 0;
    // Один цикл, временная сложность O(n)
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

    // ====== Основной код ======
    // Метод 1
    var res = twoSumBruteForce(&nums, target).?;
    std.debug.print("Метод 1: res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 
    // Метод 2
    res = (try twoSumHashTable(&nums, target)).?;
    std.debug.print("\nМетод 2: res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 

    _ = try std.io.getStdIn().reader().readByte();
}
