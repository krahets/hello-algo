﻿/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* 元素交换 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 哨兵划分 */
    static int Partition(int[] nums, int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            Swap(nums, i, j); // 交换这两个元素
        }
        Swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }

    /* 快速排序 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right)
            return;
        // 哨兵划分
        int pivot = Partition(nums, left, right);
        // 递归左子数组、右子数组
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 快速排序类（中位基准数优化） */
class QuickSortMedian {
    /* 元素交换 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 选取三个候选元素的中位数 */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 在 l 和 r 之间
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 在 m 和 r 之间
        return right;
    }

    /* 哨兵划分（三数取中值） */
    static int Partition(int[] nums, int left, int right) {
        // 选取三个候选元素的中位数
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 将中位数交换至数组最左端
        Swap(nums, left, med);
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            Swap(nums, i, j); // 交换这两个元素
        }
        Swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i;             // 返回基准数的索引
    }

    /* 快速排序 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止递归
        if (left >= right)
            return;
        // 哨兵划分
        int pivot = Partition(nums, left, right);
        // 递归左子数组、右子数组
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 快速排序类（尾递归优化） */
class QuickSortTailCall {
    /* 元素交换 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 哨兵划分 */
    static int Partition(int[] nums, int left, int right) {
        // 以 nums[left] 为基准数
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 从右向左找首个小于基准数的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 从左向右找首个大于基准数的元素
            Swap(nums, i, j); // 交换这两个元素
        }
        Swap(nums, i, left);  // 将基准数交换至两子数组的分界线
        return i; // 返回基准数的索引
    }

    /* 快速排序（尾递归优化） */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子数组长度为 1 时终止
        while (left < right) {
            // 哨兵划分操作
            int pivot = Partition(nums, left, right);
            // 对两个子数组中较短的那个执行快速排序
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 递归排序左子数组
                left = pivot + 1;  // 剩余未排序区间为 [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 递归排序右子数组
                right = pivot - 1; // 剩余未排序区间为 [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* 快速排序 */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("快速排序完成后 nums = " + string.Join(",", nums));

        /* 快速排序（中位基准数优化） */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("快速排序（中位基准数优化）完成后 nums1 = " + string.Join(",", nums1));

        /* 快速排序（尾递归优化） */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("快速排序（尾递归优化）完成后 nums2 = " + string.Join(",", nums2));
    }
}
