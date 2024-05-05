/**
 * File: two_sum.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import java.util.*;

public class two_sum {
    /* Method one: Brute force enumeration */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Two-layer loop, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* Method two: Auxiliary hash table */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // Auxiliary hash table, space complexity is O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // Single-layer loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }

    public static void main(String[] args) {
        // ======= Test Case =======
        int[] nums = { 2, 7, 11, 15 };
        int target = 13;

        // ====== Driver Code ======
        // Method one
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("Method one res = " + Arrays.toString(res));
        // Method two
        res = twoSumHashTable(nums, target);
        System.out.println("Method two res = " + Arrays.toString(res));
    }
}
