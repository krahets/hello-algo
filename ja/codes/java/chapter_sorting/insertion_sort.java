/**
 * File: insertion_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class insertion_sort {
    /* 挿入ソート */
    static void insertionSort(int[] nums) {
        // 外側のループ：ソート済み区間は [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に 1 つずらす
                j--;
            }
            nums[j + 1] = base;        // 正しい位置に base を代入する
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        insertionSort(nums);
        System.out.println("挿入ソート完了後 nums = " + Arrays.toString(nums));
    }
}
