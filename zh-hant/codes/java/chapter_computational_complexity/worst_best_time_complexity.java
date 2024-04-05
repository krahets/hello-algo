/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 生成陣列 nums = { 1, 2, 3, ..., n }
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 隨機打亂陣列元素
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 查詢陣列 nums 中數字 1 所在索引 */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
            // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
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
            System.out.println("\n陣列 [ 1, 2, ..., n ] 被打亂後 = " + Arrays.toString(nums));
            System.out.println("數字 1 的索引為 " + index);
        }
    }
}
