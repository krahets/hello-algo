/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* 要素 num の k 番目の桁を取得、exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // k の代わりに exp を渡すことで、ここでコストの高い累乗計算の繰り返しを避けることができる
        return (num / exp) % 10;
    }

    /* 計数ソート（nums の k 番目の桁に基づく） */
    static void countingSortDigit(int[] nums, int exp) {
        // 10進数の桁の範囲は 0~9、したがって長さ 10 のバケット配列が必要
        int[] counter = new int[10];
        int n = nums.length;
        // 桁 0~9 の出現回数を統計
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i] の k 番目の桁を取得、d とする
            counter[d]++;                // 桁 d の出現回数を統計
        }
        // 累積和を計算し、「出現回数」を「配列インデックス」に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 逆順に走査し、バケット統計に基づいて各要素を res に配置
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を取得
            res[j] = nums[i];       // 現在の要素をインデックス j に配置
            counter[d]--;           // d のカウントを 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    static void radixSort(int[] nums) {
        // 配列の最大要素を取得し、最大桁数を判定するために使用
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 最下位桁から最上位桁まで走査
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の k 番目の桁に対して計数ソートを実行
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }

    public static void main(String[] args) {
        // 基数ソート
        int[] nums = { 10546151, 35663510, 42865989, 34862445, 81883077,
                       88906420, 72429244, 30524779, 82060337, 63832996 };
        radixSort(nums);
        System.out.println("基数ソート後、nums = " + Arrays.toString(nums));
    }
}