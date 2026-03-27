/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Полный рюкзак: динамическое программирование */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализация таблицы dp
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // Переход состояний
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[i][c] = dp[i - 1][c]
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Полный рюкзак: динамическое программирование с оптимизацией памяти */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // Инициализация таблицы dp
    val dp = IntArray(cap + 1)
    // Переход состояний
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, предмет i не выбирать
                dp[c] = dp[c]
            } else {
                // Большее из двух решений: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // Динамическое программирование
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("Максимальная стоимость предметов без превышения вместимости рюкзака = $res")

    // Динамическое программирование с оптимизацией памяти
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("Максимальная стоимость предметов без превышения вместимости рюкзака = $res")
}