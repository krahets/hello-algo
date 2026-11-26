/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Неограниченный рюкзак: динамическое программирование */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // Переход между состояниями
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c]
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Неограниченный рюкзак: динамическое программирование с экономией памяти */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = IntArray(cap + 1)
    // Переход между состояниями
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[c] = dp[c]
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Основная программа */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // Динамическое программирование
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")

    // Динамическое программирование с экономией памяти
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")
}