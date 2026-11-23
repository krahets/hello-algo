/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Подъем по лестнице: динамическое программирование */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // Инициализация таблицы dp для хранения решений подзадач
    val dp = IntArray(n + 1)
    // Начальное состояние: заранее задать решения наименьших подзадач
    dp[1] = 1
    dp[2] = 2
    // Переход состояний: постепенное решение больших подзадач через меньшие
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
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

/* Driver Code */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")

    res = climbingStairsDPComp(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")
}