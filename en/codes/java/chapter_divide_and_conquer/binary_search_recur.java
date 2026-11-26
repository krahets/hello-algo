/**
 * File: binary_search_recur.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

public class binary_search_recur {
    /* Binary search: problem f(i, j) */
    static int dfs(int[] nums, int target, int i, int j) {
        // An empty interval contains no target, so return -1
        if (i > j) {
            return -1;
        }
        // Compute the middle index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursively solve f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursively solve f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Target found: return its index
            return m;
        }
    }

    /* Binary search */
    static int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Solve f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        // Binary search (closed interval)
        int index = binarySearch(nums, target);
        System.out.println("Index of target 6 = " + index);
    }
}
