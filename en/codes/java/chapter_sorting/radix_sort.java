/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* Get digit k of num, where exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    static void countingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        int[] counter = new int[10];
        int n = nums.length;
        // Count the occurrences of digits 0 through 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++;                // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    static void radixSort(int[] nums) {
        // Find the largest element to determine the maximum number of digits
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Work from the least significant digit to the most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
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
