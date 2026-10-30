/**
 * File: climbing_stairs_constraint_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Climbing stairs with constraints: dynamic programming */
fun climbingStairsConstraintDP(n: Int): Int {
    if (n == 1 || n == 2) {
        return 1
    }
    // Initialize the dp table to store subproblem solutions
    val dp = Array(n + 1) { IntArray(3) }
    // Initial states: set the solutions to the smallest subproblems
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // State transitions: solve progressively larger subproblems using smaller ones
    for (i in 3..n) {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

/* Driver code */
fun main() {
    val n = 9

    val res = climbingStairsConstraintDP(n)
    println("There are $res ways to climb $n stairs")
}