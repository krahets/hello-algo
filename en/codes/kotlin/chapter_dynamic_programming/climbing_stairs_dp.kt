/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Climbing stairs: Dynamic programming */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // Initialize dp table, used to store solutions to subproblems
    val dp = IntArray(n + 1)
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = 1
    dp[2] = 2
    // State transition: gradually solve larger subproblems from smaller ones
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Climbing stairs: Space-optimized dynamic programming */
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
    println("Climbing $n stairs has $res solutions")

    res = climbingStairsDPComp(n)
    println("Climbing $n stairs has $res solutions")
}