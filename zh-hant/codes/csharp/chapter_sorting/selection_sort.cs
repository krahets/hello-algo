/**
* File: selection_sort.cs
* Created Time: 2023-06-01
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_sorting;

public class selection_sort {
    /* 選擇排序 */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // 外層迴圈：未排序區間為 [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 內層迴圈：找出未排序區間中的最小元素
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 記錄最小元素的索引
            }
            // 將最小元素與未排序區間的第一個元素交換
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        SelectionSort(nums);
        Console.WriteLine("選擇排序完成後 nums = " + string.Join(" ", nums));
    }
}
