/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Подъем по лестнице с ограничениями: динамическое программирование */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // Инициализация таблицы dp для хранения решений подзадач
    val dp = Array(n + 1) { IntArray(3) }
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (i in 3..n) {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsConstraintDP(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")
}