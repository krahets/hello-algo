/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // 配列要素をランダムにシャッフル
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* 配列 nums 内で数値 1 のインデックスを探す */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
        println("\n配列 [ 1, 2, ..., n ] をシャッフルした後 = ${nums.contentToString()}")
        println("数字 1 のインデックスは $index")
    }
}