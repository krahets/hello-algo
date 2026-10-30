/**
 * File: climbing_stairs_constraint_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Climbing stairs with constraints: dynamic programming */
func climbingStairsConstraintDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    // Initialize the dp table to store subproblem solutions
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
    // Initial states: set the solutions to the smallest subproblems
    dp[1][1] = 1
    dp[1][2] = 0
    dp[2][1] = 0
    dp[2][2] = 1
    // State transitions: solve progressively larger subproblems using smaller ones
    for i in 3 ... n {
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
    }
    return dp[n][1] + dp[n][2]
}

@main
enum ClimbingStairsConstraintDP {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsConstraintDP(n: n)
        print("Number of ways to climb \(n) steps: \(res)")
    }
}
