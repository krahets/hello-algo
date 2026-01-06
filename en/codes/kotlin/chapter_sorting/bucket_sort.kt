/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Bucket sort */
fun bucketSort(nums: FloatArray) {
    // Initialize k = n/2 buckets, expected to allocate 2 elements per bucket
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. Distribute array elements into various buckets
    for (num in nums) {
        // Input data range is [0, 1), use num * k to map to index range [0, k-1]
        val i = (num * k).toInt()
        // Add num to bucket i
        buckets[i].add(num)
    }
    // 2. Sort each bucket
    for (bucket in buckets) {
        // Use built-in sorting function, can also replace with other sorting algorithms
        bucket.sort()
    }
    // 3. Traverse buckets to merge results
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Driver Code */
fun main() {
    // Assume input data is floating point, interval [0, 1)
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("After bucket sort, nums = ${nums.contentToString()}")
}