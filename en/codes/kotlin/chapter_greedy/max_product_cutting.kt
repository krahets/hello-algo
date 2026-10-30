/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* Maximum product after splitting: greedy algorithm */
fun maxProductCutting(n: Int): Int {
    // When n <= 3, one part must be 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // When the remainder is 2, no adjustment is needed
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // When the remainder is 0, no adjustment is needed
    return 3.0.pow(a).toInt()
}

/* Driver code */
fun main() {
    val n = 58

    // Greedy algorithm
    val res = maxProductCutting(n)
    println("Maximum product after splitting: $res")
}