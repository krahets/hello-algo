// File: insertion_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 挿入ソート
fn insertionSort(nums: []i32) void {
    // 外側のループ：ソート済み区間は [0, i-1]
    var i: usize = 1;
    while (i < nums.len) : (i += 1) {
        var base = nums[i];
        var j: usize = i;
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while (j >= 1 and nums[j - 1] > base) : (j -= 1) {
            nums[j] = nums[j - 1];  // nums[j] を右に 1 つずらす
        }
        nums[j] = base;             // 正しい位置に base を代入する
    }
}

// 実行用コード
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    insertionSort(&nums);
    std.debug.print("挿入ソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);
    
    _ = try std.io.getStdIn().reader().readByte();
}