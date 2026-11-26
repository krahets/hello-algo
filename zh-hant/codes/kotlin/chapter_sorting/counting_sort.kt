/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 計數排序 */
// 簡易實作，無法用來將物件排序
fun countingSortNaive(nums: IntArray) {
    // 1. 找出陣列中的最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 走訪 counter，將各元素填入原陣列 nums
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
// 完整實作，可將物件排序，且屬於穩定排序
fun countingSort(nums: IntArray) {
    // 1. 找出陣列中的最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
    // 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. 反向走訪 nums，將各元素填入結果陣列 res
    // 初始化陣列 res，用來記錄結果
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // 將 num 放到對應索引的位置
        counter[num]-- // 將前綴和減 1，取得下次放置 num 時所需的索引
    }
    // 用結果陣列 res 覆寫原陣列 nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("計數排序（無法將物件排序）完成後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("計數排序完成後 nums1 = ${nums1.contentToString()}")
}