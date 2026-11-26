/**
 * File: insertion_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

public class insertion_sort {
    /* 插入排序 */
    void InsertionSort(int[] nums) {
        // 外層迴圈：已排序的區間為 [0, i-1]
        for (int i = 1; i < nums.Length; i++) {
            int bas = nums[i], j = i - 1;
            // 內層迴圈：將 base 插入已排序區間 [0, i-1] 中的正確位置
            while (j >= 0 && nums[j] > bas) {
                nums[j + 1] = nums[j]; // 將 nums[j] 向右移動一格
                j--;
            }
            nums[j + 1] = bas;         // 將 base 寫入正確位置
        }
    }

    [Test]
    public void Test() {
        int[] nums = [4, 1, 3, 1, 5, 2];
        InsertionSort(nums);
        Console.WriteLine("插入排序完成後 nums = " + string.Join(",", nums));
    }
}
