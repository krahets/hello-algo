/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Search */
fun dfs(i: Int): Int {
    // Known dp[1] and dp[2], return them
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* Climbing stairs: Search */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("Climbing $n stairs has $res solutions")
}