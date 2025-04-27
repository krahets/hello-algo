/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* Binary search for the leftmost target */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point of target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // Did not find target, thus return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }

    /* Binary search for the rightmost target */
    static int binarySearchRightEdge(int[] nums, int target) {
        // Convert to finding the leftmost target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Did not find target, thus return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }

    public static void main(String[] args) {
        // Array with duplicate elements
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nArray nums = " + java.util.Arrays.toString(nums));

        // Binary search for left and right boundaries
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("The leftmost index of element " + target + " is " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("The rightmost index of element " + target + " is " + index);
        }
    }
}
