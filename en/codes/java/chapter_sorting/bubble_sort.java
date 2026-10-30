/**
 * File: bubble_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bubble_sort {
    /* Bubble sort */
    static void bubbleSort(int[] nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }

    /* Bubble sort (flag optimization) */
    static void bubbleSortWithFlag(int[] nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Initialize the flag
            // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record that a swap occurred
                }
            }
            if (!flag)
                break; // Exit immediately if this pass made no swaps
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("After bubble sort, nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("After bubble sort, nums1 = " + Arrays.toString(nums1));
    }
}
