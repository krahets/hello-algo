/**
 * File: bucket_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bucket_sort {
    /* Bucket sort */
    static void bucketSort(float[] nums) {
        // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
        int k = nums.length / 2;
        List<List<Float>> buckets = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            buckets.add(new ArrayList<>());
        }
        // 1. Distribute array elements into various buckets
        for (float num : nums) {
            // Input data range is [0, 1), use num * k to map to index range [0, k-1]
            int i = (int) (num * k);
            // Add num to bucket i
            buckets.get(i).add(num);
        }
        // 2. Sort each bucket
        for (List<Float> bucket : buckets) {
            // Use built-in sorting function, can also replace with other sorting algorithms
            Collections.sort(bucket);
        }
        // 3. Traverse buckets to merge results
        int i = 0;
        for (List<Float> bucket : buckets) {
            for (float num : bucket) {
                nums[i++] = num;
            }
        }
    }

    public static void main(String[] args) {
        // Assume input data is floating point, range [0, 1)
        float[] nums = { 0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f };
        bucketSort(nums);
        System.out.println("After bucket sort, nums = " + Arrays.toString(nums));
    }
}
