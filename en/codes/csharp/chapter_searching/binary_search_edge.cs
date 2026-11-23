/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* Find the leftmost occurrence of target using binary search */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }

    /* Find the rightmost occurrence of target using binary search */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j is the candidate index of the rightmost target; i is the insertion point after all elements <= target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }

    [Test]
    public void Test() {
        // Array containing duplicate elements
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nArray nums = " + nums.PrintList());

        // Find the left and right boundaries using binary search
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("Leftmost occurrence of " + target + " has index " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("Rightmost occurrence of " + target + " has index " + index);
        }
    }
}
