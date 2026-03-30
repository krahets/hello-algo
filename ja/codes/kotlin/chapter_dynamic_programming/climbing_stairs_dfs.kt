/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 検索 */
fun dfs(i: Int): Int {
    // dp[1] と dp[2] は既知なので返す
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* 階段登り：探索 */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("$n 段の階段の登り方は全部で $res 通り")
}