/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 階段登りの最小コスト：動的計画法 */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    var dp = Array(repeating: 0, count: n + 1)
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
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
        print("入力された階段のコスト一覧は \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("階段を上り切る最小コストは \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("階段を上り切る最小コストは \(res)")
    }
}
