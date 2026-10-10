/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* Binary search: problem f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Solve the problem f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Binary search (closed interval on both sides)
        int index = BinarySearch(nums, target);
        Console.WriteLine("Index of target element 6 = " + index);
    }
}
