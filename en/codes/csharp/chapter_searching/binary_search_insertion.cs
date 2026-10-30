/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* Find an insertion point using binary search (no duplicates) */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Initialize the closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Target must be in [m+1, j] if it exists
            } else if (nums[m] > target) {
                j = m - 1; // Target must be in [i, m-1] if it exists
            } else {
                return m; // Target was found; return insertion point m
            }
        }
        // Target was not found; return insertion point i
        return i;
    }

    /* Find an insertion point using binary search (with duplicates) */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Initialize the closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Target must be in [m+1, j] if it exists
            } else if (nums[m] > target) {
                j = m - 1; // Target must be in [i, m-1] if it exists
            } else {
                j = m - 1; // Continue in [i, m-1] to find the rightmost element smaller than target
            }
        }
        // Return insertion point i
        return i;
    }

    [Test]
    public void Test() {
        // Array with no duplicate elements
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\nArray nums = " + nums.PrintList());
        // Find an insertion point using binary search
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("Element " + target + " has insertion point index " + index);
        }

        // Array containing duplicate elements
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nArray nums = " + nums.PrintList());
        // Find an insertion point using binary search
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("Element " + target + " has insertion point index " + index);
        }
    }
}
