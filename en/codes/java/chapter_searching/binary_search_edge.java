/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* Use binary search to find the leftmost occurrence of target */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point for target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // Target not found. Return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Found target. Return index i
        return i;
    }

    /* Use binary search to find the rightmost occurrence of target */
    static int binarySearchRightEdge(int[] nums, int target) {
        // Search for the leftmost occurrence of target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j points to the rightmost occurrence of target, and i to the first larger element
        int j = i - 1;
        // Target not found. Return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target. Return index j
        return j;
    }

    public static void main(String[] args) {
        // Array with duplicates
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));

        // Find the left and right boundaries using binary search
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("The leftmost occurrence of " + target + " is at index " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("The rightmost occurrence of " + target + " is at index " + index);
        }
    }
}
