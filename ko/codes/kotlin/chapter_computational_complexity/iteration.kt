/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for 문 */
fun forLoop(n: Int): Int {
    var res = 0
    // 1, 2, ..., n-1, n을 차례로 더한다
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while 문 */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 2, ..., n-1, n을 차례로 더한다
    while (i <= n) {
        res += i
        i++ // 반복 조건에 쓰는 변수를 갱신한다
    }
    return res
}

/* while 문(한 번에 두 번 갱신) */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 4, 10, ...을 차례로 더한다
    while (i <= n) {
        res += i
        // 반복 조건에 쓰는 변수를 갱신한다
        i++
        i *= 2
    }
    return res
}

/* 이중 for 문 */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // i = 1, 2, ..., n-1, n에 대해 반복한다
    for (i in 1..n) {
        // j = 1, 2, ..., n-1, n에 대해 반복한다
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* 실행 예제 */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor 문의 합 res = $res")

    res = whileLoop(n)
    println("\nwhile 문의 합 res = $res")

    res = whileLoopII(n)
    println("\nwhile 문(두 번 갱신)의 합 res = $res")

    val resStr = nestedForLoop(n)
    println("\n이중 for 문의 순회 결과: $resStr")
}