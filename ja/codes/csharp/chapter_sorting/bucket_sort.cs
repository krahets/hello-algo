/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* バケットソート */
    void BucketSort(float[] nums) {
        // k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 配列の要素を各バケットに振り分ける
        foreach (float num in nums) {
            // 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
            int i = (int)(num * k);
            // num をバケット i に追加
            buckets[i].Add(num);
        }
        // 2. 各バケットをソートする
        foreach (List<float> bucket in buckets) {
            // 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
            bucket.Sort();
        }
        // 3. バケットを順に連結
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // 入力は [0, 1) の範囲の浮動小数点数とする
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("バケットソート後の nums = " + string.Join(" ", nums));
    }
}
