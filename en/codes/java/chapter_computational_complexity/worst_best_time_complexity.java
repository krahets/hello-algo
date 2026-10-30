/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* Generate an array containing { 1, 2, ..., n } in shuffled order */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // Generate the array nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // Randomly shuffle the array elements
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* Find the index of the number 1 in array nums */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // When 1 is at the start of the array, the best-case time complexity is O(1)
            // When 1 is at the end of the array, the worst-case time complexity is O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* Driver code */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\nArray [ 1, 2, ..., n ] after shuffling = " + Arrays.toString(nums));
            System.out.println("The index of the number 1 is " + index);
        }
    }
}
