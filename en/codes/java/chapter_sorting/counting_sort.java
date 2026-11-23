/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* Counting sort */
    // Simple implementation; cannot be used to sort objects
    static void countingSortNaive(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    static void countingSort(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("After counting sort (does not support objects), nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("After counting sort, nums1 = " + Arrays.toString(nums1));
    }
}
