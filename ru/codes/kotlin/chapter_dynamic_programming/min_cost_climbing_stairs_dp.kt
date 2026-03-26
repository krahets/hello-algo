/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Минимальная стоимость подъема по лестнице: динамическое программирование */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // Инициализировать таблицу dp для хранения решений подзадач
    val dp = IntArray(n + 1)
    // Начальное состояние: заранее задать решения для наименьших подзадач
    dp[1] = cost[1]
    dp[2] = cost[2]
    // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией по памяти */
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

/* Driver Code */
fun main() {
    val cost = intArrayOf(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println("Список стоимостей ступеней: ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("Минимальная стоимость подъема по лестнице равна $res")

    res = minCostClimbingStairsDPComp(cost)
    println("Минимальная стоимость подъема по лестнице равна $res")
}
