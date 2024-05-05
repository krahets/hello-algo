/**
 * File: selection_sort.java
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class selection_sort {
    /* Selection sort */
    public static void selectionSort(int[] nums) {
        int n = nums.length;
        // Outer loop: unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        selectionSort(nums);
        System.out.println("After selection sort, nums = " + Arrays.toString(nums));
    }
}
