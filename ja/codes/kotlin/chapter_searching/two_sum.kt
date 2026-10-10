/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 方法 1：総当たり列挙 */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 2重ループのため、時間計算量は O(n^2)
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* 方法 2：補助ハッシュテーブル */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // 補助ハッシュテーブルを使用し、空間計算量は O(n)
    val dic = HashMap<Int, Int>()
    // 単一ループで、時間計算量は O(n)
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
    // 方法 1
    var res = twoSumBruteForce(nums, target)
    println("方法1 res = ${res.contentToString()}")
    // 方法 2
    res = twoSumHashTable(nums, target)
    println("方法2 res = ${res.contentToString()}")
}