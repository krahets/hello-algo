/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Размен монет II: динамическое программирование */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Инициализация таблицы dp
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // Инициализация первого столбца
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // Переход состояний
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[i][a] = dp[i - 1][a]
            } else {
                // Сумма двух решений: не брать или взять монету i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Размен монет II: динамическое программирование с оптимизацией памяти */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // Инициализация таблицы dp
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // Переход состояний
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // Если целевая сумма превышена, монету i не выбирать
                dp[a] = dp[a]
            } else {
                // Сумма двух решений: не брать или взять монету i
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
    println("Количество комбинаций монет для набора целевой суммы = $res")

    // Динамическое программирование с оптимизацией памяти
    res = coinChangeIIDPComp(coins, amt)
    println("Количество комбинаций монет для набора целевой суммы = $res")
}