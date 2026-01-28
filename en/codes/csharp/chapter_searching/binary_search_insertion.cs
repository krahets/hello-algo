/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* Binary search for insertion point (no duplicate elements) */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Initialize closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // target is in the interval [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target is in the interval [i, m-1]
            } else {
                return m; // Found target, return insertion point m
            }
        }
        // Target not found, return insertion point i
        return i;
    }

    /* Binary search for insertion point (with duplicate elements) */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Initialize closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // target is in the interval [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target is in the interval [i, m-1]
            } else {
                j = m - 1; // The first element less than target is in the interval [i, m-1]
            }
        }
        // Return insertion point i
        return i;
    }

    [Test]
    public void Test() {
        // Array without duplicate elements
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\nArray nums = " + nums.PrintList());
        // Binary search for insertion point
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("Element " + target + "'s insertion point index is " + index);
        }

        // Array with duplicate elements
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nArray nums = " + nums.PrintList());
        // Binary search for insertion point
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("Element " + target + "'s insertion point index is " + index);
        }
    }
}
