/**
 * File: bucket_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class bucket_sort {
    /* Bucket sort */
    void BucketSort(float[] nums) {
        // Initialize k = n/2 buckets, expecting 2 elements per bucket
        int k = nums.Length / 2;
        List<List<float>> buckets = [];
        for (int i = 0; i < k; i++) {
            buckets.Add([]);
        }
        // 1. Distribute the array elements among the buckets
        foreach (float num in nums) {
            // The input range is [0, 1); use num * k to map each value to an index in [0, k-1]
            int i = (int)(num * k);
            // Add num to bucket i
            buckets[i].Add(num);
        }
        // 2. Sort each bucket
        foreach (List<float> bucket in buckets) {
            // Use the built-in sorting function, or replace it with another sorting algorithm
            bucket.Sort();
        }
        // 3. Traverse the buckets to combine the results
        int j = 0;
        foreach (List<float> bucket in buckets) {
            foreach (float num in bucket) {
                nums[j++] = num;
            }
        }
    }

    [Test]
    public void Test() {
        // Assume the input consists of floating-point numbers in [0, 1)
        float[] nums = [0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f];
        BucketSort(nums);
        Console.WriteLine("After bucket sort, nums = " + string.Join(" ", nums));
    }
}
