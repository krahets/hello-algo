/**
 * File: two_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Method 1: Brute force enumeration */
fun twoSumBruteForce(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Two nested loops, time complexity is O(n^2)
    for (i in 0..<size - 1) {
        for (j in i + 1..<size) {
            if (nums[i] + nums[j] == target) return intArrayOf(i, j)
        }
    }
    return IntArray(0)
}

/* Method 2: Auxiliary hash table */
fun twoSumHashTable(nums: IntArray, target: Int): IntArray {
    val size = nums.size
    // Auxiliary hash table, space complexity is O(n)
    val dic = HashMap<Int, Int>()
    // Single loop, time complexity is O(n)
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
    // Method 1
    var res = twoSumBruteForce(nums, target)
    println("Method 1 res = ${res.contentToString()}")
    // Method 2
    res = twoSumHashTable(nums, target)
    println("Method 2 res = ${res.contentToString()}")
}