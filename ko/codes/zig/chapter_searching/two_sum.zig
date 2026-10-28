// File: two_sum.zig
// Created Time: 2023-01-07
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 방법 1: 완전 열거
pub fn twoSumBruteForce(nums: []i32, target: i32) ?[2]i32 {
    var size: usize = nums.len;
    var i: usize = 0;
    // 이중 반복문이며 시간 복잡도는 O(n^2)이다
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

// 방법 2: 보조 해시 테이블
pub fn twoSumHashTable(nums: []i32, target: i32) !?[2]i32 {
    var size: usize = nums.len;
    // 보조 해시 테이블의 공간 복잡도는 O(n)이다
    var dic = std.AutoHashMap(i32, i32).init(std.heap.page_allocator);
    defer dic.deinit();
    var i: usize = 0;
    // 단일 반복문이며 시간 복잡도는 O(n)이다
    while (i < size) : (i += 1) {
        if (dic.contains(target - nums[i])) {
            return [_]i32{dic.get(target - nums[i]).?, @intCast(i)};
        }
        try dic.put(nums[i], @intCast(i));
    }
    return null;
}


pub fn main() !void {
    // ======= 테스트 사례 =======
    var nums = [_]i32{ 2, 7, 11, 15 };
    var target: i32 = 9;

    // ====== 실행 코드 ======
    // 방법 1
    var res = twoSumBruteForce(&nums, target).?;
    std.debug.print("방법 1 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 
    // 방법 2
    res = (try twoSumHashTable(&nums, target)).?;
    std.debug.print("\n방법 2 res = ", .{});
    inc.PrintUtil.printArray(i32, &res); 

    _ = try std.io.getStdIn().reader().readByte();
}
