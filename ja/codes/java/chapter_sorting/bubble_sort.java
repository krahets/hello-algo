/**
 * File: bubble_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bubble_sort {
    /* バブルソート */
    static void bubbleSort(int[] nums) {
        // 外側ループ: 未ソート範囲は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側ループ: 未ソート範囲 [0, i] の最大要素を範囲の右端に交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }

    /* バブルソート（フラグによる最適化） */
    static void bubbleSortWithFlag(int[] nums) {
        // 外側ループ: 未ソート範囲は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // フラグを初期化
            // 内側ループ: 未ソート範囲 [0, i] の最大要素を範囲の右端に交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換された要素を記録
                }
            }
            if (!flag)
                break; // この「バブリング」ラウンドで要素が交換されなかった場合、終了
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("バブルソート後、nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("バブルソート後、nums1 = " + Arrays.toString(nums1));
    }
}