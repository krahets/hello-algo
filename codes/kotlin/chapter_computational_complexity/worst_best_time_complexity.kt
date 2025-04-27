/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // 生成数组 nums = { 1, 2, 3, ..., n }
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // 随机打乱数组元素
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* 查找数组 nums 中数字 1 所在索引 */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
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
        println("\n数组 [ 1, 2, ..., n ] 被打乱后 = ${nums.contentToString()}")
        println("数字 1 的索引为 $index")
    }
}