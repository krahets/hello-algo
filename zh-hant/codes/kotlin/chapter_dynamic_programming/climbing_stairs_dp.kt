/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 爬樓梯：動態規劃 */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // 初始化 dp 表，用於儲存子問題的解
    val dp = IntArray(n + 1)
    // 初始狀態：預設最小子問題的解
    dp[1] = 1
    dp[2] = 2
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 爬樓梯：空間最佳化後的動態規劃 */
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
    println("爬 $n 階樓梯共有 $res 種方案")

    res = climbingStairsDPComp(n)
    println("爬 $n 階樓梯共有 $res 種方案")
}