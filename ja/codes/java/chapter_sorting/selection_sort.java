/**
 * File: selection_sort.java
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class selection_sort {
    /* 選択ソート */
    public static void selectionSort(int[] nums) {
        int n = nums.length;
        // 外側ループ: 未ソート範囲は [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // 内側ループ: 未ソート範囲内で最小要素を見つける
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // 最小要素のインデックスを記録
            }
            // 最小要素と未ソート範囲の最初の要素を交換
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        selectionSort(nums);
        System.out.println("選択ソート後、nums = " + Arrays.toString(nums));
    }
}