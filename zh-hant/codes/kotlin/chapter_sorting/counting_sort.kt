/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 計數排序 */
// 簡單實現，無法用於排序物件
fun countingSortNaive(nums: IntArray) {
    // 1. 統計陣列最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 走訪 counter ，將各元素填入原陣列 nums
    var i = 0
    for (num in 0..<m + 1) {
        var j = 0
        while (j < counter[num]) {
            nums[i] = num
            j++
            i++
        }
    }
}

/* 計數排序 */
// 完整實現，可排序物件，並且是穩定排序
fun countingSort(nums: IntArray) {
    // 1. 統計陣列最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. 倒序走訪 nums ，將各元素填入結果陣列 res
    // 初始化陣列 res 用於記錄結果
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // 將 num 放置到對應索引處
        counter[num]-- // 令前綴和自減 1 ，得到下次放置 num 的索引
    }
    // 使用結果陣列 res 覆蓋原陣列 nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("計數排序（無法排序物件）完成後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("計數排序完成後 nums1 = ${nums1.contentToString()}")
}