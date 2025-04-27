/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for 循环 */
fun forLoop(n: Int): Int {
    var res = 0
    // 循环求和 1, 2, ..., n-1, n
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while 循环 */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // 更新条件变量
    }
    return res
}

/* while 循环（两次更新） */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while (i <= n) {
        res += i
        // 更新条件变量
        i++
        i *= 2
    }
    return res
}

/* 双层 for 循环 */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // 循环 i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // 循环 j = 1, 2, ..., n-1, n
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* Driver Code */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor 循环的求和结果 res = $res")

    res = whileLoop(n)
    println("\nwhile 循环的求和结果 res = $res")

    res = whileLoopII(n)
    println("\nwhile 循环 (两次更新) 求和结果 res = $res")

    val resStr = nestedForLoop(n)
    println("\n双层 for 循环的遍历结果 $resStr")
}