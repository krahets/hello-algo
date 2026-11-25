/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* Use binary search to find the leftmost occurrence of target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point for target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // Target not found. Return -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Found target. Return index i
        return i;
    }

    /* Use binary search to find the rightmost occurrence of target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Search for the leftmost occurrence of target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j points to the rightmost occurrence of target, and i to the first larger element
        int j = i - 1;
        // Target not found. Return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target. Return index j
        return j;
    }

    [Test]
    public void Test() {
        // Array with duplicates
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nArray nums = " + nums.PrintList());

        // Find the left and right boundaries using binary search
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("The leftmost occurrence of " + target + " is at index " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("The rightmost occurrence of " + target + " is at index " + index);
        }
    }
}
