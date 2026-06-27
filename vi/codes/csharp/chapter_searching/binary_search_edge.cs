/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* Binary search for the leftmost target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point of target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }

    /* Binary search for the rightmost target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Convert to finding the leftmost target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }

    [Test]
    public void Test() {
        // Array with duplicate elements
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nArray nums = " + nums.PrintList());

        // Binary search left and right boundaries
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("Leftmost element " + target + " has index " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("Rightmost element " + target + " has index " + index);
        }
    }
}
