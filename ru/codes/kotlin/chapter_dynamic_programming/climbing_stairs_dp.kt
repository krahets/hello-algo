/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Подъём по лестнице: динамическое программирование */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // Создать таблицу dp для решений подзадач
    val dp = IntArray(n + 1)
    // Начальные состояния: задать решения простейших подзадач
    dp[1] = 1
    dp[2] = 2
    // Переход: решать подзадачи от меньших к большим
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Подъём по лестнице: динамическое программирование с экономией памяти */
fun climbingStairsDPComp(n: Int): Int {
    if (n == 1 || n == 2) return n
    var a = 1
    var b = 2
    for (i in 3..n) {
        val temp = b
        b += a
        a = temp
    }
    return b
}

/* Основная программа */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("Число способов подняться на лестницу из $n ступеней: $res.")

    res = climbingStairsDPComp(n)
    println("Число способов подняться на лестницу из $n ступеней: $res.")
}