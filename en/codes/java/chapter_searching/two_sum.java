/**
 * File: two_sum.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import java.util.*;

public class two_sum {
    /* Method 1: brute-force enumeration */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Two nested loops give a time complexity of O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* Method 2: auxiliary hash table */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // The auxiliary hash table uses O(n) space
        Map<Integer, Integer> dic = new HashMap<>();
        // A single loop gives a time complexity of O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }

    public static void main(String[] args) {
        // ======= Test case =======
        int[] nums = { 2, 7, 11, 15 };
        int target = 13;

        // ====== Driver code ======
        // Method 1
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("Method 1: res = " + Arrays.toString(res));
        // Method 2
        res = twoSumHashTable(nums, target);
        System.out.println("Method 2: res = " + Arrays.toString(res));
    }
}
