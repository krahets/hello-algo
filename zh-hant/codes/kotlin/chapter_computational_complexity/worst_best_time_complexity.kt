/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // 隨機打亂陣列元素
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* 查詢陣列 nums 中數字 1 所在索引 */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if (nums[i] == 1)
            return i
    }
    return -1
}

/* Driver Code */
fun main() {
    for (i in 0..9) {
        val n = 100
        val nums = randomNumbers(n)
        val index = findOne(nums)
        println("\n陣列 [ 1, 2, ..., n ] 被打亂後 = ${nums.contentToString()}")
        println("數字 1 的索引為 $index")
    }
}