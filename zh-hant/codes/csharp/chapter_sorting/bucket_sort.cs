/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* 桶排序 */
    void BucketSort(float[] nums) {
        // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 將陣列元素分配到各個桶中
        foreach (float num in nums) {
            // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
            int i = (int)(num * k);
            // 將 num 新增進桶 i
            buckets[i].Add(num);
        }
        // 2. 對各個桶執行排序
        foreach (List<float> bucket in buckets) {
            // 使用內建排序函式，也可以替換成其他排序演算法
            bucket.Sort();
        }
        // 3. 走訪桶合併結果
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // 設輸入資料為浮點數，範圍為 [0, 1)
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("桶排序完成後 nums = " + string.Join(" ", nums));
    }
}
