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
        // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. 配列の要素を各バケットに振り分ける
        for (float num : nums) {
            // 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
            int i = (int) (num * k);
            // num をバケット i に追加
            buckets.get(i).add(num);
        }
        // 2. 各バケットをソートする
        for (List<Float> bucket : buckets) {
            // 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
            Collections.sort(bucket);
        }
        // 3. バケットを順に連結
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // 入力は [0, 1) の範囲の浮動小数点数とする
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("バケットソート後の nums = " + Arrays.toString(nums));
    }
}
