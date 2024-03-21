/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 搜尋 */
fun dfs(i: Int): Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* 爬樓梯：搜尋 */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("爬 $n 階樓梯共有 $res 種方案")
}