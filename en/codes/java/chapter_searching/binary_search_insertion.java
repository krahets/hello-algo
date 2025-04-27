/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* Binary search for insertion point (no duplicate elements) */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize double closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Target is in interval [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Target is in interval [i, m-1]
            } else {
                return m; // Found target, return insertion point m
            }
        }
        // Did not find target, return insertion point i
        return i;
    }

    /* Binary search for insertion point (with duplicate elements) */
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Initialize double closed interval [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate midpoint index m
            if (nums[m] < target) {
                i = m + 1; // Target is in interval [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Target is in interval [i, m-1]
            } else {
                j = m - 1; // First element less than target is in interval [i, m-1]
            }
        }
        // Return insertion point i
        return i;
    }

    public static void main(String[] args) {
        // Array without duplicate elements
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Binary search for insertion point
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("The insertion point index for element " + target + " is " + index);
        }

        // Array with duplicate elements
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));
        // Binary search for insertion point
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("The insertion point index for element " + target + " is " + index);
        }
    }
}
