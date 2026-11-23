/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Размен монет: динамическое программирование */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Инициализация таблицы dp
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Переход состояний: первая строка и первый столбец
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // Переход состояний: остальные строки и столбцы
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a]
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* Размен монет: динамическое программирование с оптимизацией памяти */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // Инициализация таблицы dp
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // Переход состояний
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a]
            } else {
                // Меньшее из двух решений: не брать или взять монету i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // Динамическое программирование
    var res = coinChangeDP(coins, amt)
    println("Минимальное число монет для набора целевой суммы = $res")

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeDPComp(coins, amt)
    println("Минимальное число монет для набора целевой суммы = $res")
}