// File: quick_sort.zig
// Created Time: 2023-01-15
// Author: codingonion (coderonion@gmail.com)

const std = @import("std");
const inc = @import("include");

// 快速排序类
const QuickSort = struct {

    // 元素交换
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 哨兵划分
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 以 nums[left] 为基准数
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 从右向左找首个小于基准数的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 从左向右找首个大于基准数的元素
            swap(nums, i, j);   // 交换这两个元素
        }
        swap(nums, i, left);    // 将基准数交换至两子数组的分界线
        return i;               // 返回基准数的索引
    }

    // 快速排序
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        var pivot = partition(nums, left, right);
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 快速排序类（中位基准数优化）
const QuickSortMedian = struct {

    // 元素交换
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 选取三个候选元素的中位数
    pub fn medianThree(nums: []i32, left: usize, mid: usize, right: usize) usize {
        var l = nums[left];
        var m = nums[mid];
        var r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    // 哨兵划分（三数取中值）
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 选取三个候选元素的中位数
        var med = medianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        swap(nums, left, med);
        // 以 nums[left] 为基准数
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 从右向左找首个小于基准数的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 从左向右找首个大于基准数的元素
            swap(nums, i, j);   // 交换这两个元素
        }
        swap(nums, i, left);    // 将基准数交换至两子数组的分界线
        return i;               // 返回基准数的索引
    }

    // 快速排序
    pub fn quickSort(nums: []i32, left: usize, right: usize) void {
        // 子数组长度为 1 时终止递归
        if (left >= right) return;
        // 哨兵划分
        var pivot = partition(nums, left, right);
        if (pivot == 0) return;
        // 递归左子数组、右子数组
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

// 快速排序类（尾递归优化）
const QuickSortTailCall = struct {

    // 元素交换
    pub fn swap(nums: []i32, i: usize, j: usize) void {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    // 哨兵划分
    pub fn partition(nums: []i32, left: usize, right: usize) usize {
        // 以 nums[left] 为基准数
        var i = left;
        var j = right;
        while (i < j) {
            while (i < j and nums[j] >= nums[left]) j -= 1; // 从右向左找首个小于基准数的元素
            while (i < j and nums[i] <= nums[left]) i += 1; // 从左向右找首个大于基准数的元素
            swap(nums, i, j);   // 交换这两个元素
        }
        swap(nums, i, left);    // 将基准数交换至两子数组的分界线
        return i;               // 返回基准数的索引
    }

    // 快速排序（尾递归优化）
    pub fn quickSort(nums: []i32, left_: usize, right_: usize) void {
        var left = left_;
        var right = right_;
        // 子数组长度为 1 时终止递归
        while (left < right) {
            // 哨兵划分操作
            var pivot = partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1);   // 递归排序左子数组
                left = pivot + 1;                   // 剩余未排序区间为 [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right);  // 递归排序右子数组
                right = pivot - 1;                  // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
};

// Driver Code
pub fn main() !void {
    // 快速排序
    var nums = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSort.quickSort(&nums, 0, nums.len - 1);
    std.debug.print("快速排序完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums);

    // 快速排序（中位基准数优化）
    var nums1 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortMedian.quickSort(&nums1, 0, nums1.len - 1);
    std.debug.print("\n快速排序（中位基准数优化）完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums1);

    // 快速排序（尾递归优化）
    var nums2 = [_]i32{ 2, 4, 1, 0, 3, 5 };
    QuickSortTailCall.quickSort(&nums2, 0, nums2.len - 1);
    std.debug.print("\n快速排序（尾递归优化）完成后 nums = ", .{});
    inc.PrintUtil.printArray(i32, &nums2);
    
    _ = try std.io.getStdIn().reader().readByte();
}