/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Minimum cost to climb stairs: dynamic programming */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // Initialize the dp table to store subproblem solutions
    var dp = Array(repeating: 0, count: n + 1)
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = cost[1]
    dp[2] = cost[2]
    // State transitions: solve progressively larger subproblems using smaller ones
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* Minimum cost to climb stairs: space-optimized dynamic programming */
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
    /* Driver code */
    static func main() {
        let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
        print("Input stair costs: \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("Minimum cost to climb the stairs: \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("Minimum cost to climb the stairs: \(res)")
    }
}
