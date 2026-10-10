/**
 * File: worst_best_time_complexity.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

import java.util.*;

public class worst_best_time_complexity {
    /* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
    static int[] randomNumbers(int n) {
        Integer[] nums = new Integer[n];
        // 配列 nums = { 1, 2, 3, ..., n } を生成
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }
        // 配列要素をランダムにシャッフル
        Collections.shuffle(Arrays.asList(nums));
        // Integer[] -> int[]
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = nums[i];
        }
        return res;
    }

    /* 配列 nums 内で数値 1 のインデックスを探す */
    static int findOne(int[] nums) {
        for (int i = 0; i < nums.length; i++) {
            // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
            // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
            System.out.println("\n配列 [ 1, 2, ..., n ] をシャッフルした後 = " + Arrays.toString(nums));
            System.out.println("数字 1 のインデックスは " + index);
        }
    }
}
