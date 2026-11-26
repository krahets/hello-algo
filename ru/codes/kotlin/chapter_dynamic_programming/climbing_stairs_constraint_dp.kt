/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Подъём по лестнице с ограничением: динамическое программирование */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // Создать таблицу dp для решений подзадач
    val dp = Array(n + 1) { IntArray(3) }
    // Начальные состояния: задать решения простейших подзадач
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // Переход: решать подзадачи от меньших к большим
    for (i in 3..n) {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

/* Основная программа */
fun main() {
    val n = 9

    val res = climbingStairsConstraintDP(n)
    println("Число способов подняться на лестницу из $n ступеней: $res.")
}