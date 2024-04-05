/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 爬樓梯最小代價：動態規劃 */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // 初始化 dp 表，用於儲存子問題的解
    var dp = Array(repeating: 0, count: n + 1)
    // 初始狀態：預設最小子問題的解
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 狀態轉移：從較小子問題逐步求解較大子問題
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 爬樓梯最小代價：空間最佳化後的動態規劃 */
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
        print("輸入樓梯的代價串列為 \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("爬完樓梯的最低代價為 \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("爬完樓梯的最低代價為 \(res)")
    }
}
