/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* Цикл for */
fun forLoop(n: Int): Int {
    var res = 0
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    for (i in 1..n) {
        res += i
    }
    return res
}

/* Цикл while */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 2, ..., n-1, n
    while (i <= n) {
        res += i
        i++ // Обновить управляющую переменную
    }
    return res
}

/* Цикл while (с двумя обновлениями) */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // Инициализировать управляющую переменную
    // В цикле вычислить сумму 1, 4, 10, ...
    while (i <= n) {
        res += i
        // Обновить управляющую переменную
        i++
        i *= 2
    }
    return res
}

/* Двойной цикл for */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // Цикл i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // Цикл j = 1, 2, ..., n-1, n
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
    println("\nРезультат суммирования в цикле for res = $res")

    res = whileLoop(n)
    println("\nРезультат суммирования в цикле while res = $res")

    res = whileLoopII(n)
    println("\nРезультат суммирования в цикле while (с двумя обновлениями) res = $res")

    val resStr = nestedForLoop(n)
    println("\nРезультат обхода двойным циклом for $resStr")
}
