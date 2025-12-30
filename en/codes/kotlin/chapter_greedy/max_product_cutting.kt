/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* Max product cutting: Greedy algorithm */
fun maxProductCutting(n: Int): Int {
    // When n <= 3, must cut out a 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // Greedily cut out 3, a is the number of 3s, b is the remainder
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // When the remainder is 2, do nothing
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // When the remainder is 0, do nothing
    return 3.0.pow(a).toInt()
}

/* Driver Code */
fun main() {
    val n = 58

    // Greedy algorithm
    val res = maxProductCutting(n)
    println("Maximum cutting product is $res")
}