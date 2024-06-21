/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 桶排序 */
fun bucketSort(nums: FloatArray) {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. 將陣列元素分配到各個桶中
    for (num in nums) {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        val i = (num * k).toInt()
        // 將 num 新增進桶 i
        buckets[i].add(num)
    }
    // 2. 對各個桶執行排序
    for (bucket in buckets) {
        // 使用內建排序函式，也可以替換成其他排序演算法
        bucket.sort()
    }
    // 3. 走訪桶合併結果
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* Driver Code */
fun main() {
    // 設輸入資料為浮點數，範圍為 [0, 1)
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("桶排序完成後 nums = ${nums.contentToString()}")
}