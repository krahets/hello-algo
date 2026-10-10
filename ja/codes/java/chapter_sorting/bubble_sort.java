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
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
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

    /* バブルソート（フラグ最適化） */
    static void bubbleSortWithFlag(int[] nums) {
        // 外側のループ：未ソート区間は [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // フラグを初期化する
            // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // nums[j] と nums[j + 1] を交換
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // 交換する要素を記録
                }
            }
            if (!flag)
                break; // このバブル処理で要素交換が一度もなければそのまま終了
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("バブルソート完了後の nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("バブルソート完了後の nums1 = " + Arrays.toString(nums1));
    }
}
