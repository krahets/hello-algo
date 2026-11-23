/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Climbing stairs: dynamic programming */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // Initialize the dp table to store subproblem solutions
    var dp = Array(repeating: 0, count: n + 1)
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = 1
    dp[2] = 2
    // State transitions: solve progressively larger subproblems using smaller ones
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Climbing stairs: space-optimized dynamic programming */
func climbingStairsDPComp(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var a = 1
    var b = 2
    for _ in 3 ... n {
        (a, b) = (b, a + b)
    }
    return b
}

@main
enum ClimbingStairsDP {
    /* Driver code */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("Number of ways to climb \(n) steps: \(res)")

        res = climbingStairsDPComp(n: n)
        print("Number of ways to climb \(n) steps: \(res)")
    }
}
