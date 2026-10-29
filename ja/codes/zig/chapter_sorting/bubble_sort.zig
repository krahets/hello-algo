// File: bubble_sort.zig
// Created Time: 2023-01-08
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// バブルソート
fn bubbleSort(nums: []i32) void {
    // 外側のループ：未ソート区間は [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var j: usize = 0;
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// バブルソート（フラグによる最適化）
fn bubbleSortWithFlag(nums: []i32) void {
    // 外側のループ：未ソート区間は [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // フラグを初期化する
        var j: usize = 0;
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
    }
}

// 実行用コード
pub fn main() !void {
    var nums = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSort(&nums);
    std.debug.print("バブルソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    var nums1 = [_]i32{ 4, 1, 3, 1, 5, 2 };
    bubbleSortWithFlag(&nums1);
    std.debug.print("\nバブルソート完了後 nums1 = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);
    
    _ = try std.io.getStdIn().reader().readByte();
}

