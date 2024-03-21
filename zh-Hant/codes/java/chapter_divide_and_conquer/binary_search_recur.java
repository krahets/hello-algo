/**
 * File: binary_search_recur.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

public class binary_search_recur {
    /* 二分搜尋：問題 f(i, j) */
    static int dfs(int[] nums, int target, int i, int j) {
        // 若區間為空，代表無目標元素，則返回 -1
        if (i > j) {
            return -1;
        }
        // 計算中點索引 m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // 遞迴子問題 f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // 遞迴子問題 f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }

    /* 二分搜尋 */
    static int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // 求解問題 f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        // 二分搜尋（雙閉區間）
        int index = binarySearch(nums, target);
        System.out.println("目標元素 6 的索引 = " + index);
    }
}
