/**
 * File: iteration.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.iteration

/* Цикл for */
fun forLoop(n: Int): Int {
    var res = 0
    // Сложить числа 1, 2, ..., n-1, n в цикле
    for (i in 1..n) {
        res += i
    }
    return res
}

/* Цикл while */
fun whileLoop(n: Int): Int {
    var res = 0
    var i = 1 // Задать начальное значение переменной условия
    // Сложить числа 1, 2, ..., n-1, n в цикле
    while (i <= n) {
        res += i
        i++ // Обновить переменную условия
    }
    return res
}

/* Цикл while с двумя обновлениями */
fun whileLoopII(n: Int): Int {
    var res = 0
    var i = 1 // Задать начальное значение переменной условия
    // Сложить числа 1, 4, 10, ... в цикле
    while (i <= n) {
        res += i
        // Обновить переменную условия
        i++
        i *= 2
    }
    return res
}

/* Вложенные циклы for */
fun nestedForLoop(n: Int): String {
    val res = StringBuilder()
    // Перебрать i = 1, 2, ..., n-1, n
    for (i in 1..n) {
        // Перебрать j = 1, 2, ..., n-1, n
        for (j in 1..n) {
            res.append(" ($i, $j), ")
        }
    }
    return res.toString()
}

/* Основная программа */
fun main() {
    val n = 5
    var res: Int

    res = forLoop(n)
    println("\nСумма в цикле for: res = $res")

    res = whileLoop(n)
    println("\nСумма в цикле while: res = $res")

    res = whileLoopII(n)
    println("\nСумма в цикле while с двумя обновлениями: res = $res")

    val resStr = nestedForLoop(n)
    println("\nРезультат обхода вложенными циклами for: $resStr")
}