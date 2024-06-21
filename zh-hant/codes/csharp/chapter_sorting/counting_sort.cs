/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* 計數排序 */
    // 簡單實現，無法用於排序物件
    void CountingSortNaive(int[] nums) {
        // 1. 統計陣列最大元素 m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 統計各數字的出現次數
        // counter[num] 代表 num 的出現次數
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. 走訪 counter ，將各元素填入原陣列 nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* 計數排序 */
    // 完整實現，可排序物件，並且是穩定排序
    void CountingSort(int[] nums) {
        // 1. 統計陣列最大元素 m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 統計各數字的出現次數
        // counter[num] 代表 num 的出現次數
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序走訪 nums ，將各元素填入結果陣列 res
        // 初始化陣列 res 用於記錄結果
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // 將 num 放置到對應索引處
            counter[num]--; // 令前綴和自減 1 ，得到下次放置 num 的索引
        }
        // 使用結果陣列 res 覆蓋原陣列 nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("計數排序（無法排序物件）完成後 nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("計數排序完成後 nums1 = " + string.Join(" ", nums));
    }
}
