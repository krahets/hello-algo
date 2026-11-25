/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* Counting sort */
    // Simple implementation that cannot sort objects
    static void countingSortNaive(int[] nums) {
        // 1. Find the largest array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] holds the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter and write each value back into nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Counting sort */
    // Full implementation that can sort objects and is stable
    static void countingSort(int[] nums) {
        // 1. Find the largest array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] holds the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums in counter to locate the last position for each value
        // That is, counter[num]-1 is the last index of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums backward and place each element in the result array res
        // Initialize the result array res
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at its corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to find the next index for num
        }
        // Copy res back into the original array nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("After counting sort (values only), nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("After counting sort, nums1 = " + Arrays.toString(nums1));
    }
}
