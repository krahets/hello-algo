/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* Max capacity: Greedy algorithm */
fun maxCapacity(ht: IntArray): Int {
    // Initialize i, j to be at both ends of the array
    var i = 0
    var j = ht.size - 1
    // Initial max capacity is 0
    var res = 0
    // Loop for greedy selection until the two boards meet
    while (i < j) {
        // Update max capacity
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Move the shorter board inward
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // Greedy algorithm
    val res = maxCapacity(ht)
    println("Maximum capacity is $res")
}