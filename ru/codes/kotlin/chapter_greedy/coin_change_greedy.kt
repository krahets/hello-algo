/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Размен монет: жадный алгоритм */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Список coins предполагается отсортированным
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Повторяем жадный выбор, пока остаток суммы не обнулится
    while (am > 0) {
        // Ищем ближайший к остатку номинал среди меньших, чем остаток
        while (i > 0 && coins[i] > am) {
            i--
        }
        // Берём coins[i]
        am -= coins[i]
        count++
    }
    // Если решения не нашлось, возвращаем -1
    return if (am == 0) count else -1
}

/* Пример запуска */
fun main() {
    // Для этих номиналов жадный алгоритм гарантирует глобальный оптимум
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для суммы $amt минимальное число монет: $res")

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для суммы $amt минимальное число монет: $res")
    println("На самом деле минимум — 3 монеты: 20 + 20 + 20")

    // Для этих номиналов жадный алгоритм не гарантирует глобального оптимума
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для суммы $amt минимальное число монет: $res")
    println("На самом деле минимум — 2 монеты: 49 + 49")
}