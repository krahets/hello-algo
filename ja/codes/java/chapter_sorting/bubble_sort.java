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
        // 外側のループ：未整列区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
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
        // 外側のループ：未整列区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // フラグを初期化
            // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換があったことを記録
                }
            }
            if (!flag)
                break; // この走査で交換がなければループを終了
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("バブルソート後の nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("バブルソート後の nums1 = " + Arrays.toString(nums1));
    }
}
