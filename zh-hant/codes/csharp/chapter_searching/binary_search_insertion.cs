/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* 用二分搜尋找插入點（無重複元素） */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 將閉區間設為 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 若存在，必在區間 [m+1, j] 內
            } else if (nums[m] > target) {
                j = m - 1; // target 若存在，必在區間 [i, m-1] 內
            } else {
                return m; // 找到 target，回傳插入點 m
            }
        }
        // 找不到 target，回傳插入點 i
        return i;
    }

    /* 用二分搜尋找插入點（有重複元素） */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // 將閉區間設為 [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // 計算中點索引 m
            if (nums[m] < target) {
                i = m + 1; // target 若存在，必在區間 [m+1, j] 內
            } else if (nums[m] > target) {
                j = m - 1; // target 若存在，必在區間 [i, m-1] 內
            } else {
                j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
            }
        }
        // 回傳插入點 i
        return i;
    }

    [Test]
    public void Test() {
        // 不含重複元素的陣列
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\n陣列 nums = " + nums.PrintList());
        // 用二分搜尋找插入點
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("元素 " + target + " 的插入位置索引為 " + index);
        }

        // 含有重複元素的陣列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\n陣列 nums = " + nums.PrintList());
        // 用二分搜尋找插入點
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("元素 " + target + " 的插入位置索引為 " + index);
        }
    }
}
