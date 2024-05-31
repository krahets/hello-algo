/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* Generate an array with elements {1, 2, ..., n} in a randomly shuffled order */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Generate array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle array elements
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Find the index of number 1 in array nums */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // When element 1 is at the start of the array, achieve best time complexity O(1)
            // When element 1 is at the end of the array, achieve worst time complexity O(n)
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
            System.out.println("\nThe array [ 1, 2, ..., n ] after being shuffled = " + Arrays.toString(nums));
            System.out.println("The index of number 1 is " + index);
        }
    }
}
