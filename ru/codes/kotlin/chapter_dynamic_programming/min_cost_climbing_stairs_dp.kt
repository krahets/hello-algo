/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Минимальная стоимость подъёма: динамическое программирование */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // Создать таблицу dp для решений подзадач
    val dp = IntArray(n + 1)
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = cost[1]
    dp[2] = cost[2]
    // Переход: решать подзадачи от меньших к большим
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
fun minCostClimbingStairsDPComp(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    var a = cost[1]
    var b = cost[2]
    for (i in 3..n) {
        val tmp = b
        b = min(a, tmp) + cost[i]
        a = tmp
    }
    return b
}

/* Основная программа */
fun main() {
    val cost = intArrayOf(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println("Стоимость ступеней: ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("Минимальная стоимость подъёма: $res")

    res = minCostClimbingStairsDPComp(cost)
    println("Минимальная стоимость подъёма: $res")
}