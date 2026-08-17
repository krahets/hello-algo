/**
 * File: complexity_exercises.kt
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

package chapter_computational_complexity.complexity_exercises

/* 反復による総和 */
fun sumIter(n: Int): Int {
    var res = 0
    for (i in 1..n) {
        res += i
    }
    return res
}

/* 再帰による総和 */
fun sumRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return n + sumRecur(n - 1)
}

/* 線形時間のループ */
fun linearLoop(n: Int): Int {
    var res = 0
    for (i in 0 until n) {
        res += i
    }
    return res
}

/* 二次時間のループ */
fun quadraticLoop(n: Int): Int {
    var res = 0
    for (i in 0 until n) {
        for (j in i until n) {
            res += j
        }
    }
    return res
}

/* 対数時間のループ */
fun logarithmicLoop(n: Int): Int {
    var value = n
    while (value > 1) {
        value /= 2
    }
    return value
}

fun main() {
    check(sumIter(1) == 1 && sumRecur(1) == 1)
    check(sumIter(4) == 10 && sumRecur(4) == 10)
    check(linearLoop(4) == 6)
    check(quadraticLoop(4) == 20)
    check(logarithmicLoop(4) == 1 && logarithmicLoop(5) == 1)
}
