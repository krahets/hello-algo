/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 建立陣列 nums = { 1, 2, 3, ..., n }
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

    /* 在陣列 nums 中尋找數字 1 的索引 */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
            // 若 1 在陣列末端，最差時間複雜度為 O(n)
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }

    /* 主程式 */
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = randomNumbers(n);
            int index = findOne(nums);
            System.out.println("\n陣列 [ 1, 2, ..., n ] 打亂順序後 = " + Arrays.toString(nums));
            System.out.println("數字 1 的索引為 " + index);
        }
    }
}
