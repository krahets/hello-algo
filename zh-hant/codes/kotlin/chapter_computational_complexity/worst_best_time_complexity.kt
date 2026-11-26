/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // 建立陣列 nums = { 1, 2, 3, ..., n }
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

/* 在陣列 nums 中尋找數字 1 的索引 */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if (nums[i] == 1)
            return i
    }
    return -1
}

/* 主程式 */
fun main() {
    for (i in 0..9) {
        val n = 100
        val nums = randomNumbers(n)
        val index = findOne(nums)
        println("\n陣列 [ 1, 2, ..., n ] 打亂順序後 = ${nums.contentToString()}")
        println("數字 1 的索引為 $index")
    }
}