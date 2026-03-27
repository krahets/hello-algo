/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Размен монет: жадный алгоритм */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Предположить, что список coins упорядочен
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Циклически выполнять жадный выбор, пока не останется суммы
    while (am > 0) {
        // Найти монету, которая меньше остатка суммы и наиболее к нему близка
        while (i > 0 && coins[i] > am) {
            i--
        }
        // Выбрать coins[i]
        am -= coins[i]
        count++
    }
    // Если допустимое решение не найдено, вернуть -1
    return if (am == 0) count else -1
}

/* Driver Code */
fun main() {
    // Жадный подход: гарантирует нахождение глобально оптимального решения
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Минимальное число монет для набора суммы $amt = $res")

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Минимальное число монет для набора суммы $amt = $res")
    println("На самом деле минимум равен 3: 20 + 20 + 20")

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Минимальное число монет для набора суммы $amt = $res")
    println("На самом деле минимум равен 2: 49 + 49")
}