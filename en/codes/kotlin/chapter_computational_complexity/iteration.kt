/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for loop */
fun forLoop(n: Int): Int {
    var res = 0
    // Sum 1, 2, ..., n-1, n
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while loop */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // Initialize condition variable
    // Sum 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // Update condition variable
    }
    return res
}

/* while loop (two updates) */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // Initialize condition variable
    // Sum 1, 4, 10, ...
    while (i <= n) {
        res += i
        // Update condition variable
        i++
        i *= 2
    }
    return res
}

/* Nested for loop */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // Loop i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // Loop j = 1, 2, ..., n-1, n
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
    println("\nFor loop sum result res = $res")

    res = whileLoop(n)
    println("\nWhile loop sum result res = $res")

    res = whileLoopII(n)
    println("\nWhile loop (two updates) sum result res = $res")

    val resStr = nestedForLoop(n)
    println("\nNested for loop traversal result $resStr")
}