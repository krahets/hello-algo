/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* Find the leftmost occurrence of target using binary search */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }

    /* Find the rightmost occurrence of target using binary search */
    static int binarySearchRightEdge(int[] nums, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }

    public static void main(String[] args) {
        // Array containing duplicate elements
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));

        // Find the left and right boundaries using binary search
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("Leftmost occurrence of " + target + " has index " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("Rightmost occurrence of " + target + " has index " + index);
        }
    }
}
