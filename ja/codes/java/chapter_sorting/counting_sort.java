/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* 計数ソート */
    // 簡易実装のため、オブジェクトのソートには使えない
    static void countingSortNaive(int[] nums) {
        // 1. 配列の最大要素 m を求める
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き戻す
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* 計数ソート */
    // 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
    static void countingSort(int[] nums) {
        // 1. 配列の最大要素 m を求める
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
        // つまり counter[num]-1 は、num が res に最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に格納する
        // 結果を記録するための配列 res を初期化
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を配置するインデックスを得る
        }
        // 結果配列 res で元の配列 nums を上書きする
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("カウントソート（オブジェクトはソート不可）完了後の nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("カウントソート完了後の nums1 = " + Arrays.toString(nums1));
    }
}
