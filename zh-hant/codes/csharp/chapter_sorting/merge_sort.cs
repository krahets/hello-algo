/**
 * File: merge_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class merge_sort {
    /* 合併左、右子陣列 */
    void Merge(int[] nums, int left, int mid, int right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        int[] tmp = new int[right - left + 1];
        // 設定左、右子陣列的起始索引
        int i = left, j = mid + 1, k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    void MergeSort(int[] nums, int left, int right) {
        // 終止條件
        if (left >= right) return;       // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        int mid = left + (right - left) / 2;    // 計算中點
        MergeSort(nums, left, mid);      // 遞迴處理左子陣列
        MergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        Merge(nums, left, mid, right);
    }

    [Test]
    public void Test() {
        /* 合併排序 */
        int[] nums = [7, 3, 2, 6, 0, 1, 5, 4];
        MergeSort(nums, 0, nums.Length - 1);
        Console.WriteLine("合併排序完成後 nums = " + string.Join(",", nums));
    }
}
