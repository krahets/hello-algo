/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* Greedy maximum capacity algorithm */
fun maxCapacity(ht: IntArray): Int {
    // Start i and j at opposite ends of the array
    var i = 0
    var j = ht.size - 1
    // The initial maximum capacity is 0
    var res = 0
    // Make greedy choices until the two pointers meet
    while (i < j) {
        // Update the maximum capacity
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // Move the pointer at the shorter board inward
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
    println("The maximum capacity is $res")
}