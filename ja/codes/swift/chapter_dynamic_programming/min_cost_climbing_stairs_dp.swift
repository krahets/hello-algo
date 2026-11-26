/**
 * File: min_cost_climbing_stairs_dp.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 階段を登る最小コスト：動的計画法 */
func minCostClimbingStairsDP(cost: [Int]) -> Int {
    let n = cost.count - 1
    if n == 1 || n == 2 {
        return cost[n]
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    var dp = Array(repeating: 0, count: n + 1)
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in 3 ... n {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 階段を登る最小コスト：使用メモリを削減した動的計画法 */
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
    /* 実行例 */
    static func main() {
        let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
        print("各段のコストの入力リストは \(cost)")

        var res = minCostClimbingStairsDP(cost: cost)
        print("階段を登りきる最小コストは \(res)")

        res = minCostClimbingStairsDPComp(cost: cost)
        print("階段を登りきる最小コストは \(res)")
    }
}
