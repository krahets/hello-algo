/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* Find an insertion point using binary search (no duplicates) */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
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
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize the closed interval [0, n-1]
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

    public static void main(String[] args) {
        // Array with no duplicate elements
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Find an insertion point using binary search
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("Element " + target + " has insertion point index " + index);
        }

        // Array containing duplicate elements
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Find an insertion point using binary search
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("Element " + target + " has insertion point index " + index);
        }
    }
}
