/**
 * File: binary_search.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class binary_search {
    /* Binary search (closed interval on both sides) */
    int BinarySearch(int[] nums, int target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        int i = 0, j = nums.Length - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1;
            else                       // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }

    /* Binary search (left-closed right-open interval) */
    int BinarySearchLCRO(int[] nums, int target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        int i = 0, j = nums.Length;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m;
            else                       // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        /* Binary search (closed interval on both sides) */
        int index = BinarySearch(nums, target);
        Console.WriteLine("Index of target element 6 = " + index);

        /* Binary search (left-closed right-open interval) */
        index = BinarySearchLCRO(nums, target);
        Console.WriteLine("Index of target element 6 = " + index);
    }
}
