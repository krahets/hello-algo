/**
 * File: binary_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class binary_search {
    /* Binary search on a closed interval */
    int BinarySearch(int[] nums, int target) {
        // Initialize the closed interval [0, n-1] with i at the first element and j at the last
        int i = 0, j = nums.Length - 1;
        // Stop when the search interval is empty (i > j)
        while (i <= j) {
            int m = i + (j - i) / 2;   // Compute the midpoint index m
            if (nums[m] < target)      // Any match must lie in [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // Any match must lie in [i, m-1]
                j = m - 1;
            else                       // Found the target. Return its index
                return m;
        }
        // Target not found. Return -1
        return -1;
    }

    /* Binary search on a left-closed, right-open interval */
    int BinarySearchLCRO(int[] nums, int target) {
        // Initialize [0, n) with i at the first element and j one past the last
        int i = 0, j = nums.Length;
        // Stop when the search interval is empty (i = j)
        while (i < j) {
            int m = i + (j - i) / 2;   // Compute the midpoint index m
            if (nums[m] < target)      // Any match must lie in [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // Any match must lie in [i, m)
                j = m;
            else                       // Found the target. Return its index
                return m;
        }
        // Target not found. Return -1
        return -1;
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        /* Binary search on a closed interval */
        int index = BinarySearch(nums, target);
        Console.WriteLine("Index of target 6 = " + index);

        /* Binary search on a left-closed, right-open interval */
        index = BinarySearchLCRO(nums, target);
        Console.WriteLine("Index of target 6 = " + index);
    }
}
