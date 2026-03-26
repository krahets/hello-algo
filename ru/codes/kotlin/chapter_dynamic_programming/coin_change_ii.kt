/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Размен монет II: динамическое программирование */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Инициализировать таблицу dp
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Инициализировать первый столбец
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // Переход состояния
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Инициализировать таблицу dp
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // Переход состояния
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если сумма превышает целевое значение, не брать монету i
                dp[a] = dp[a]
            } else {
                // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // Динамическое программирование
    var res = coinChangeIIDP(coins, amt)
    println("Количество комбинаций монет для получения целевой суммы равно $res")

    // Динамическое программирование с оптимизацией по памяти
    res = coinChangeIIDPComp(coins, amt)
    println("Количество комбинаций монет для получения целевой суммы равно $res")
}
