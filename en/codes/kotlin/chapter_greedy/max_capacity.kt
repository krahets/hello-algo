/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* Maximum container capacity: greedy algorithm */
fun maxCapacity(ht: IntArray): Int {
    // Initialize i and j at opposite ends of the array
    var i = 0
    var j = ht.size - 1
    // The initial maximum capacity is 0
    var res = 0
    // Repeatedly make greedy choices until the two sides meet
    while (i < j) {
        // Update the maximum capacity
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Move the shorter side inward
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* Driver code */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // Greedy algorithm
    val res = maxCapacity(ht)
    println("Maximum container capacity: $res")
}