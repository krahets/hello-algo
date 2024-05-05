/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Climbing stairs with minimum cost: Dynamic programming */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // Initialize dp table, used to store subproblem solutions
    var dp = Array(repeating: 0, count: n + 1)
    // Initial state: preset the smallest subproblem solution
    dp[1] = cost[1]
    dp[2] = cost[2]
    // State transition: gradually solve larger subproblems from smaller ones
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Climbing stairs with minimum cost: Space-optimized dynamic programming */
func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    var (a, b) = (cost[1], cost[2])
    for i in 3 ... n {
        (a, b) = (b, min(a, b) + cost[i])
    }
    return b
}

@main
enum MinCostClimbingStairsDP {
    /* Driver Code */
    static func main() {
        let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
        print("Input stair cost list = \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("Minimum cost to climb the stairs = \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("Minimum cost to climb the stairs = \(res)")
    }
}
