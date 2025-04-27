/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 方法一：暴力列舉 */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 兩層迴圈，時間複雜度為 O(n^2)
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* 方法二：輔助雜湊表 */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 輔助雜湊表，空間複雜度為 O(n)
    val dic = HashMap<Int, Int>()
    // 單層迴圈，時間複雜度為 O(n)
    for (i in 0..<size) {
        if (dic.containsKey(target - nums[i])) {
            return intArrayOf(dic[target - nums[i]]!!, i)
        }
        dic[nums[i]] = i
    }
    return IntArray(0)
}

/* Driver Code */
fun main() {
    // ======= Test Case =======
    val nums = intArrayOf(2, 7, 11, 15)
    val target = 13

    // ====== Driver Code ======
    // 方法一
    var res = twoSumBruteForce(nums, target)
    println("方法一 res = ${res.contentToString()}")
    // 方法二
    res = twoSumHashTable(nums, target)
    println("方法二 res = ${res.contentToString()}")
}