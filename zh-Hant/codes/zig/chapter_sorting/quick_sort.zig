// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 快速排序類別
const QuickSort = struct {

    // 元素交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 哨兵劃分
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 以 nums[left] 為基準數
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 從右向左找首個小於基準數的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 從左向右找首個大於基準數的元素
            swap(nums, i, j);   // 交換這兩個元素
        }
        swap(nums, i, left);    // 將基準數交換至兩子陣列的分界線
        return i;               // 返回基準數的索引
    }

    // 快速排序
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) return;
        // 哨兵劃分
        var pivot = partition(nums, left, right);
        // 遞迴左子陣列、右子陣列
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 快速排序類別（中位基準數最佳化）
const QuickSortMedian = struct {

    // 元素交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 選取三個候選元素的中位數
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之間
        return right;
    }

    // 哨兵劃分（三數取中值）
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 選取三個候選元素的中位數
        var med = medianThree(nums, left, (left + right) / 2, right);
        // 將中位數交換至陣列最左端
        swap(nums, left, med);
        // 以 nums[left] 為基準數
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 從右向左找首個小於基準數的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 從左向右找首個大於基準數的元素
            swap(nums, i, j);   // 交換這兩個元素
        }
        swap(nums, i, left);    // 將基準數交換至兩子陣列的分界線
        return i;               // 返回基準數的索引
    }

    // 快速排序
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right) return;
        // 哨兵劃分
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // 遞迴左子陣列、右子陣列
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 快速排序類別（尾遞迴最佳化）
const QuickSortTailCall = struct {

    // 元素交換
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 哨兵劃分
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 以 nums[left] 為基準數
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 從右向左找首個小於基準數的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 從左向右找首個大於基準數的元素
            swap(nums, i, j);   // 交換這兩個元素
        }
        swap(nums, i, left);    // 將基準數交換至兩子陣列的分界線
        return i;               // 返回基準數的索引
    }

    // 快速排序（尾遞迴最佳化）
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // 子陣列長度為 1 時終止遞迴
        while (left < right) {
            // 哨兵劃分操作
            var pivot = partition(nums, left, right);
            // 對兩個子陣列中較短的那個執行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // 遞迴排序左子陣列
                left = pivot + 1;                   // 剩餘未排序區間為 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // 遞迴排序右子陣列
                right = pivot - 1;                  // 剩餘未排序區間為 [left, pivot - 1]
            }
        }
    }
};

// Driver Code
pub fn main() !void {
    // 快速排序
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("快速排序完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // 快速排序（中位基準數最佳化）
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\n快速排序（中位基準數最佳化）完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // 快速排序（尾遞迴最佳化）
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\n快速排序（尾遞迴最佳化）完成後 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}