/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* Generate a shuffled array containing { 1, 2, ..., n } */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Shuffle the array elements at random
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Find the index of 1 in the array nums */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // Best case: 1 is the first element, so the search takes O(1) time
            // Worst case: 1 is the last element, so the search takes O(n) time
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* Driver Code */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\nShuffled array [ 1, 2, ..., n ] = " + Arrays.toString(nums));
            System.out.println("Index of 1 = " + index);
        }
    }
}
