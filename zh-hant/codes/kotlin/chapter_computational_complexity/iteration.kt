/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for 迴圈 */
fun forLoop(n: Int): Int {
    var res = 0
    // 迴圈加總 1, 2, ..., n-1, n
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while 迴圈 */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // 初始化條件變數
    // 迴圈加總 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // 更新條件變數
    }
    return res
}

/* while 迴圈（更新兩次） */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // 初始化條件變數
    // 迴圈加總 1, 4, 10, ...
    while (i <= n) {
        res += i
        // 更新條件變數
        i++
        i *= 2
    }
    return res
}

/* 雙層 for 迴圈 */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // 迴圈 i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // 迴圈 j = 1, 2, ..., n-1, n
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* 主程式 */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nfor 迴圈的總和 res = $res")

    res = whileLoop(n)
    println("\nwhile 迴圈的總和 res = $res")

    res = whileLoopII(n)
    println("\nwhile 迴圈（更新兩次）的總和 res = $res")

    val resStr = nestedForLoop(n)
    println("\n雙層 for 迴圈走訪的結果 $resStr")
}