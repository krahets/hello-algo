/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* 二分搜尋：問題 f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // 若區間為空，代表無目標元素，則返回 -1
        if (i > j) {
            return -1;
        }
        // 計算中點索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 遞迴子問題 f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 遞迴子問題 f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }

    /* 二分搜尋 */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // 求解問題 f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // 二分搜尋（雙閉區間）
        int index = BinarySearch(nums, target);
        Console.WriteLine("目標元素 6 的索引 = " + index);
    }
}
