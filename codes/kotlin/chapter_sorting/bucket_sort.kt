/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 桶排序 */
fun bucketSort(nums: FloatArray) {
    // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. 将数组元素分配到各个桶中
    for (num in nums) {
        // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
        val i = (num * k).toInt()
        // 将 num 添加进桶 i
        buckets[i].add(num)
    }
    // 2. 对各个桶执行排序
    for (bucket in buckets) {
        // 使用内置排序函数，也可以替换成其他排序算法
        bucket.sort()
    }
    // 3. 遍历桶合并结果
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Driver Code */
fun main() {
    // 设输入数据为浮点数，范围为 [0, 1)
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("桶排序完成后 nums = ${nums.contentToString()}")
}