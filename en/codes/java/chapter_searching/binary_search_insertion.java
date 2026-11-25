/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* Binary search for an insertion point (no duplicates) */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Compute the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Any match must lie in [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Any match must lie in [i, m-1]
            } else {
                return m; // Found target. Return insertion point m
            }
        }
        // Target not found. Return insertion point i
        return i;
    }

    /* Binary search for an insertion point (duplicates allowed) */
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Compute the midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Any match must lie in [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Any match must lie in [i, m-1]
            } else {
                j = m - 1; // Look in [i, m-1] for the rightmost element less than target
            }
        }
        // Return insertion point i
        return i;
    }

    public static void main(String[] args) {
        // Array without duplicates
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Find the insertion point using binary search
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("Element " + target + " has insertion index " + index);
        }

        // Array with duplicates
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Find the insertion point using binary search
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("Element " + target + " has insertion index " + index);
        }
    }
}
