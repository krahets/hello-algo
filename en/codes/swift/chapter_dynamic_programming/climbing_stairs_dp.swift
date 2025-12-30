/**
 * File: climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Climbing stairs: Dynamic programming */
func climbingStairsDP(n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    // Initialize dp table, used to store solutions to subproblems
    var dp = Array(repeating: 0, count: n + 1)
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = 1
    dp[2] = 2
    // State transition: gradually solve larger subproblems from smaller ones
    for i in 3 ... n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* Climbing stairs: Space-optimized dynamic programming */
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
    /* Driver Code */
    static func main() {
        let n = 9

        var res = climbingStairsDP(n: n)
        print("Climbing \(n) stairs has \(res) solutions")

        res = climbingStairsDPComp(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}
