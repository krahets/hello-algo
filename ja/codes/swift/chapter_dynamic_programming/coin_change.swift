/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 硬貨の両替：動的計画法 */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // dp テーブルを初期化する
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 状態遷移：先頭行と先頭列
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // 状態遷移：残りの行と列
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* 硬貨の両替：空間を最適化した動的計画法 */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // dp テーブルを初期化する
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // 状態遷移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* 実行用コード */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // 動的計画法
        var res = coinChangeDP(coins: coins, amt: amt)
        print("目標金額にするために必要な硬貨の最小枚数は \(res)")

        // 空間を最適化した動的計画法
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("目標金額にするために必要な硬貨の最小枚数は \(res)")
    }
}
