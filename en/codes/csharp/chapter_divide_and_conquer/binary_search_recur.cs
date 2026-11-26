/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* Binary search: problem f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // An empty interval contains no target, so return -1
        if (i > j) {
            return -1;
        }
        // Compute the middle index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursively solve f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursively solve f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Target found: return its index
            return m;
        }
    }

    /* Binary search */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Solve f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Binary search (closed interval)
        int index = BinarySearch(nums, target);
        Console.WriteLine("Index of target 6 = " + index);
    }
}
