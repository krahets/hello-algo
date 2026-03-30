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
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

// バブルソート（フラグ最適化）
fn bubbleSortWithFlag(nums: []i32) void {
    // 外側のループ：未ソート区間は [0, i]
    var i: usize = nums.len - 1;
    while (i > 0) : (i -= 1) {
        var flag = false;   // フラグを初期化する
        var j: usize = 0;
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        while (j < i) : (j += 1) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                var tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;
            }
        }
        if (!flag) break;   // このバブル処理で要素交換が一度もなければそのまま終了
    }
}

// Driver Code
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

