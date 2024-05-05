/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    static void countingSortDigit(int[] nums, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        int[] counter = new int[10];
        int n = nums.length;
        // Count the occurrence of digits 0~9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++;                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    static void radixSort(int[] nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Traverse from the lowest to the highest digit
        for (int exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }

    public static void main(String[] args) {
        // Radix sort
        int[] nums = { 10546151, 35663510, 42865989, 34862445, 81883077,
                       88906420, 72429244, 30524779, 82060337, 63832996 };
        radixSort(nums);
        System.out.println("After radix sort, nums = " + Arrays.toString(nums));
    }
}
