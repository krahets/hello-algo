/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* 交換元素 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 哨兵分割 */
    static int Partition(int[] nums, int left, int right) {
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 從左向右尋找第一個大於基準值的元素
            Swap(nums, i, j); // 交換這兩個元素
        }
        Swap(nums, i, left);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i;             // 回傳基準值的索引
    }

    /* 快速排序 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right)
            return;
        // 哨兵分割
        int pivot = Partition(nums, left, right);
        // 遞迴處理左、右子陣列
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（以中位數作為基準值的最佳化） */
class QuickSortMedian {
    /* 交換元素 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 取三個候選元素的中位數 */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m 介於 l 和 r 之間
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l 介於 m 和 r 之間
        return right;
    }

    /* 哨兵分割（三數取中） */
    static int Partition(int[] nums, int left, int right) {
        // 取三個候選元素的中位數
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // 將中位數與陣列最左端的元素交換
        Swap(nums, left, med);
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 從左向右尋找第一個大於基準值的元素
            Swap(nums, i, j); // 交換這兩個元素
        }
        Swap(nums, i, left);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i;             // 回傳基準值的索引
    }

    /* 快速排序 */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子陣列長度為 1 時終止遞迴
        if (left >= right)
            return;
        // 哨兵分割
        int pivot = Partition(nums, left, right);
        // 遞迴處理左、右子陣列
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* 快速排序類別（遞迴深度最佳化） */
class QuickSortTailCall {
    /* 交換元素 */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* 哨兵分割 */
    static int Partition(int[] nums, int left, int right) {
        // 以 nums[left] 為基準值
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // 從右向左尋找第一個小於基準值的元素
            while (i < j && nums[i] <= nums[left])
                i++;          // 從左向右尋找第一個大於基準值的元素
            Swap(nums, i, j); // 交換這兩個元素
        }
        Swap(nums, i, left);  // 交換元素，將基準值移到兩個子陣列的交界處
        return i; // 回傳基準值的索引
    }

    /* 快速排序（遞迴深度最佳化） */
    public static void QuickSort(int[] nums, int left, int right) {
        // 子陣列長度為 1 時終止
        while (left < right) {
            // 執行哨兵分割
            int pivot = Partition(nums, left, right);
            // 對兩個子陣列中較短的一個執行快速排序
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // 遞迴排序左子陣列
                left = pivot + 1;  // 剩餘的未排序區間為 [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // 遞迴排序右子陣列
                right = pivot - 1; // 剩餘的未排序區間為 [left, pivot - 1]
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
        Console.WriteLine("快速排序完成後 nums = " + string.Join(",", nums));

        /* 快速排序（以中位數作為基準值的最佳化） */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("快速排序（以中位數作為基準值的最佳化）完成後 nums1 = " + string.Join(",", nums1));

        /* 快速排序（遞迴深度最佳化） */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("快速排序（遞迴深度最佳化）完成後 nums2 = " + string.Join(",", nums2));
    }
}
