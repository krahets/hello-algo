/**
 * File: unbounded_knapsack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 個数制限なしナップサック問題：動的計画法 */
func unboundedKnapsackDP(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp テーブルを初期化する
    var dp = Array(repeating: Array(repeating: 0, count: cap + 1), count: n + 1)
    // 状態遷移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 容量を超える場合は品物 i を選ばない
                dp[i][c] = dp[i - 1][c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 個数制限なしナップサック問題：使用メモリを削減した動的計画法 */
func unboundedKnapsackDPComp(wgt: [Int], val: [Int], cap: Int) -> Int {
    let n = wgt.count
    // dp テーブルを初期化する
    var dp = Array(repeating: 0, count: cap + 1)
    // 状態遷移
    for i in 1 ... n {
        for c in 1 ... cap {
            if wgt[i - 1] > c {
                // 容量を超える場合は品物 i を選ばない
                dp[c] = dp[c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
            }
        }
    }
    return dp[cap]
}

@main
enum UnboundedKnapsack {
    /* 実行例 */
    static func main() {
        let wgt = [1, 2, 3]
        let val = [5, 11, 15]
        let cap = 4

        // 動的計画法
        var res = unboundedKnapsackDP(wgt: wgt, val: val, cap: cap)
        print("容量内でナップサックに入る品物の最大価値は \(res)")

        // 使用メモリを削減した動的計画法
        res = unboundedKnapsackDPComp(wgt: wgt, val: val, cap: cap)
        print("容量内でナップサックに入る品物の最大価値は \(res)")
    }
}
