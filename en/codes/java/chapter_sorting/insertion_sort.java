/**
 * File: insertion_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class insertion_sort {
    /* Insertion sort */
    static void insertionSort(int[] nums) {
        // Outer loop: sorted range is [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // Inner loop: insert base into the correct position within the sorted range [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
                j--;
            }
            nums[j + 1] = base;        // Assign base to the correct position
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        insertionSort(nums);
        System.out.println("After insertion sort, nums = " + Arrays.toString(nums));
    }
}
