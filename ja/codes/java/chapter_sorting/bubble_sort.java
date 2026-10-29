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
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }

    /* バブルソート（フラグによる最適化） */
    static void bubbleSortWithFlag(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換する
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 要素を交換したことを記録する
                }
            }
            if (!flag)
                break; // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("バブルソート完了後 nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("バブルソート完了後 nums1 = " + Arrays.toString(nums1));
    }
}
