/**
 * File: fast_power.kt
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

package chapter_divide_and_conquer.fast_power

/* 快速冪 */
fun fastPow(x: Int, n: Int): Int {
    if (n == 0) {
        return 1
    }
    val half = fastPow(x, n / 2)
    if (n % 2 == 0) {
        return half * half
    }
    return half * half * x
}

fun main() {
    check(fastPow(7, 0) == 1)
    check(fastPow(3, 5) == 243)
    check(fastPow(2, 6) == 64)
}
