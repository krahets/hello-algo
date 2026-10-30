/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* for loop */
fun forLoop(n: Int): Int {
    var res = 0
    // Sum 1, 2, ..., n-1, n in a loop
    for (i in 1..n) {
        res += i
    }
    return res
}

/* while loop */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // Initialize the loop control variable
    // Sum 1, 2, ..., n-1, n in a loop
    while (i <= n) {
        res += i
        i++ // Update the loop control variable
    }
    return res
}

/* while loop (two updates) */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // Initialize the loop control variable
    // Sum 1, 4, 10, ... in a loop
    while (i <= n) {
        res += i
        // Update the loop control variable
        i++
        i *= 2
    }
    return res
}

/* Nested for loops */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // Loop over i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // Loop over j = 1, 2, ..., n-1, n
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* Driver code */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nSum from the for loop: res = $res")

    res = whileLoop(n)
    println("\nSum from the while loop: res = $res")

    res = whileLoopII(n)
    println("\nSum from the while loop (two updates): res = $res")

    val resStr = nestedForLoop(n)
    println("\nTraversal result from the nested for loops: $resStr")
}