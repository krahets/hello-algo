/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* 計数ソート */
    // 簡単な実装、オブジェクトのソートには使用できない
    static void countingSortNaive(int[] nums) {
        // 1. 配列の最大要素 m を統計
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に戻す
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* 計数ソート */
    // 完全な実装、オブジェクトをソートでき、安定ソート
    static void countingSort(int[] nums) {
        // 1. 配列の最大要素 m を統計
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter の累積和を計算し、「出現回数」を「尻尾インデックス」に変換
        // counter[num]-1 は res 内で num が出現する最後のインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に配置
        // 結果を記録する配列 res を初期化
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減算し、num を配置する次のインデックスを取得
        }
        // 結果配列 res を使って元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("計数ソート後（オブジェクトソート不可）、nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("計数ソート後、nums1 = " + Arrays.toString(nums1));
    }
}