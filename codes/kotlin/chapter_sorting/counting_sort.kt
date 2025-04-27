/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 计数排序 */
// 简单实现，无法用于排序对象
fun countingSortNaive(nums: IntArray) {
    // 1. 统计数组最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 遍历 counter ，将各元素填入原数组 nums
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

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
fun countingSort(nums: IntArray) {
    // 1. 统计数组最大元素 m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // 将 num 放置到对应索引处
        counter[num]-- // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("计数排序（无法排序对象）完成后 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("计数排序完成后 nums1 = ${nums1.contentToString()}")
}