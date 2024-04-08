/**
 * File: two_sum.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

import java.util.*;

public class two_sum {
    /* 方法一：暴力列舉 */
    static int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // 兩層迴圈，時間複雜度為 O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }

    /* 方法二：輔助雜湊表 */
    static int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // 輔助雜湊表，空間複雜度為 O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // 單層迴圈，時間複雜度為 O(n)
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
        // 方法一
        int[] res = twoSumBruteForce(nums, target);
        System.out.println("方法一 res = " + Arrays.toString(res));
        // 方法二
        res = twoSumHashTable(nums, target);
        System.out.println("方法二 res = " + Arrays.toString(res));
    }
}
