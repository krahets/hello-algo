/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Размен монет: жадный алгоритм */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Предположим, что список coins упорядочен
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Повторять жадный выбор, пока не останется суммы
    while (am > 0) {
        // Найти монету, которая меньше оставшейся суммы и ближе всего к ней
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
    // Жадный подход: позволяет гарантированно найти глобально оптимальное решение
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для получения $amt минимальное число монет равно $res")

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для получения $amt минимальное число монет равно $res")
    println("Фактически минимальное необходимое количество равно 3, то есть 20 + 20 + 20")

    // Жадный подход: не гарантирует нахождение глобально оптимального решения
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Для получения $amt минимальное число монет равно $res")
    println("Фактически минимальное необходимое количество равно 2, то есть 49 + 49")
}
