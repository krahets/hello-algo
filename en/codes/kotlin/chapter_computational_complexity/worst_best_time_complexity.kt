/**
 * File: worst_best_time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.worst_best_time_complexity

/* Generate a shuffled array containing { 1, 2, ..., n } */
fun randomNumbers(n: Int): Array<Int?> {
    val nums = IntArray(n)
    // Generate the array nums = { 1, 2, 3, ..., n }
    for (i in 0..<n) {
        nums[i] = i + 1
    }
    // Shuffle the array elements at random
    nums.shuffle()
    val res = arrayOfNulls<Int>(n)
    for (i in 0..<n) {
        res[i] = nums[i]
    }
    return res
}

/* Find the index of 1 in the array nums */
fun findOne(nums: Array<Int?>): Int {
    for (i in nums.indices) {
        // Best case: 1 is the first element, so the search takes O(1) time
        // Worst case: 1 is the last element, so the search takes O(n) time
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
        println("\nShuffled array [ 1, 2, ..., n ] = ${nums.contentToString()}")
        println("Index of 1 = $index")
    }
}