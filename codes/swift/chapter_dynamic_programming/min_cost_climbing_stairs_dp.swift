/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 爬楼梯最小代价：动态规划 */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // 初始化 dp 表，用于存储子问题的解
    var dp = Array(repeating: 0, count: n + 1)
    // 初始状态：预设最小子问题的解
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 状态转移：从较小子问题逐步求解较大子问题
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 爬楼梯最小代价：空间优化后的动态规划 */
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
        print("输入楼梯的代价列表为 \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("爬完楼梯的最低代价为 \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("爬完楼梯的最低代价为 \(res)")
    }
}
