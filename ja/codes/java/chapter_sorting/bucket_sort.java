/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* バケットソート */
    static void bucketSort(float[] nums) {
        // k = n/2 個のバケットを初期化、各バケットに期待される要素数は 2 個
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 配列要素を各バケットに分散
        for (float num : nums) {
            // 入力データ範囲は [0, 1)、num * k を使ってインデックス範囲 [0, k-1] にマッピング
            int i = (int) (num * k);
            // num をバケット i に追加
            buckets.get(i).add(num);
        }
        // 2. 各バケットをソート
        for (List<Float> bucket : buckets) {
            // 組み込みソート関数を使用、他のソートアルゴリズムに置き換えることも可能
            Collections.sort(bucket);
        }
        // 3. バケットを走査して結果をマージ
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // 入力データが浮動小数点、範囲 [0, 1) と仮定
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("バケットソート後、nums = " + Arrays.toString(nums));
    }
}