/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* 桶排序 */
    void BucketSort(float[] nums) {
        // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. 将数组元素分配到各个桶中
        foreach (float num in nums) {
            // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
            int i = (int)(num * k);
            // 将 num 添加进桶 i
            buckets[i].Add(num);
        }
        // 2. 对各个桶执行排序
        foreach (List<float> bucket in buckets) {
            // 使用内置排序函数，也可以替换成其他排序算法
            bucket.Sort();
        }
        // 3. 遍历桶合并结果
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // 设输入数据为浮点数，范围为 [0, 1)
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("桶排序完成后 nums = " + string.Join(" ", nums));
    }
}
