/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* 要素 num の下から k 桁目を取得（exp = 10^(k-1)） */
    static int digit(int num, int exp) {
        // ここで高コストな累乗計算を繰り返さないよう、k ではなく exp を渡す
        return (num / exp) % 10;
    }

    /* 計数ソート（nums の k 桁目でソート） */
    static void countingSortDigit(int[] nums, int exp) {
        // 10 進数の各桁は 0~9 の範囲なので、長さ 10 のバケット配列が必要
        int[] counter = new int[10];
        int n = nums.length;
        // 0~9 の各数字の出現回数を集計する
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i] の第 k 位を取得し、d とする
            counter[d]++;                // 数字 d の出現回数を数える
        }
        // 累積和を求め、「出現回数」を「配列インデックス」に変換する
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 逆順に走査し、バケット内の集計結果に従って各要素を res に格納する
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // d の配列内インデックス j を取得する
            res[j] = nums[i];       // 現在の要素をインデックス j に格納する
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書きする
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    static void radixSort(int[] nums) {
        // 最大桁数の判定用に配列の最大要素を取得
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 下位桁から上位桁の順に走査する
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の k 桁目に対して計数ソートを行う
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // つまり exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }

    public static void main(String[] args) {
        // 基数ソート
        int[] nums = { 10546151, 35663510, 42865989, 34862445, 81883077,
                       88906420, 72429244, 30524779, 82060337, 63832996 };
        radixSort(nums);
        System.out.println("基数ソート完了後の nums = " + Arrays.toString(nums));
    }
}
