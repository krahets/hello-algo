/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Поиск */
fun dfs(i: Int): Int {
    // dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* Подъем по лестнице: поиск */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")
}