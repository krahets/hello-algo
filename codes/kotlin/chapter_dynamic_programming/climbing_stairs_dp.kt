/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 爬楼梯：动态规划 */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // 初始化 dp 表，用于存储子问题的解
    val dp = IntArray(n + 1)
    // 初始状态：预设最小子问题的解
    dp[1] = 1
    dp[2] = 2
    // 状态转移：从较小子问题逐步求解较大子问题
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 爬楼梯：空间优化后的动态规划 */
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
    println("爬 $n 阶楼梯共有 $res 种方案")

    res = climbingStairsDPComp(n)
    println("爬 $n 阶楼梯共有 $res 种方案")
}