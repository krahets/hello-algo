/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Method one: Brute force enumeration */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Two-layer loop, time complexity is O(n^2)
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* Method two: Auxiliary hash table */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Auxiliary hash table, space complexity is O(n)
    val dic = HashMap<Int, Int>()
    // Single-layer loop, time complexity is O(n)
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
    // Method one
    var res = twoSumBruteForce(nums, target)
    println("Method one res = ${res.contentToString()}")
    // Method two
    res = twoSumHashTable(nums, target)
    println("Method two res = ${res.contentToString()}")
}