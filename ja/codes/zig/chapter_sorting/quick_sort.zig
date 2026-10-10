// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// クイックソートクラス
const QuickSort = struct {

    // 要素の交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 番兵分割
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // nums[left] を基準値とする
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 右から左へ基準値未満の最初の要素を探す
            while (i < j and nums[i] <= nums[left]) i += 1; // 左から右へ基準値より大きい最初の要素を探す
            swap(nums, i, j);   // この 2 つの要素を交換
        }
        swap(nums, i, left);    // 基準値を 2 つの部分配列の境界へ交換する
        return i;               // 基準値のインデックスを返す
    }

    // クイックソート
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right) return;
        // 番兵分割
        var pivot = partition(nums, left, right);
        // 左右の部分配列を再帰処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// クイックソートクラス（中央値ピボット最適化）
const QuickSortMedian = struct {

    // 要素の交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 3つの候補要素の中央値を選ぶ
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m は l と r の間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l は m と r の間
        return right;
    }

    // 番兵による分割処理（3 点中央値）
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 3つの候補要素の中央値を選ぶ
        var med = medianThree(nums, left, (left + right) / 2, right);
        // 中央値を配列の最左端に交換する
        swap(nums, left, med);
        // nums[left] を基準値とする
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 右から左へ基準値未満の最初の要素を探す
            while (i < j and nums[i] <= nums[left]) i += 1; // 左から右へ基準値より大きい最初の要素を探す
            swap(nums, i, j);   // この 2 つの要素を交換
        }
        swap(nums, i, left);    // 基準値を 2 つの部分配列の境界へ交換する
        return i;               // 基準値のインデックスを返す
    }

    // クイックソート
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 部分配列の長さが 1 なら再帰を終了する
        if (left >= right) return;
        // 番兵分割
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // 左右の部分配列を再帰処理
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// クイックソートクラス（再帰深度最適化）
const QuickSortTailCall = struct {

    // 要素の交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 番兵分割
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // nums[left] を基準値とする
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 右から左へ基準値未満の最初の要素を探す
            while (i < j and nums[i] <= nums[left]) i += 1; // 左から右へ基準値より大きい最初の要素を探す
            swap(nums, i, j);   // この 2 つの要素を交換
        }
        swap(nums, i, left);    // 基準値を 2 つの部分配列の境界へ交換する
        return i;               // 基準値のインデックスを返す
    }

    // クイックソート（再帰深度最適化）
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // 部分配列の長さが 1 なら再帰を終了する
        while (left < right) {
            // 番兵による分割処理
            var pivot = partition(nums, left, right);
            // 2 つの部分配列のうち短いほうにクイックソートを適用する
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // 左部分配列を再帰的にソート
                left = pivot + 1;                   // 未ソート区間の残りは [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // 右部分配列を再帰的にソート
                right = pivot - 1;                  // 未ソート区間の残りは [left, pivot - 1]
            }
        }
    }
};

// Driver Code
pub fn main() !void {
    // クイックソート
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("クイックソート完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // クイックソート（中央値の基準値で最適化）
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\nクイックソート（中央値ピボット最適化）完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // クイックソート（再帰深度最適化）
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\nクイックソート（再帰深度最適化）完了後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}