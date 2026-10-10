/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* コイン両替 II：動的計画法 */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // dp テーブルを初期化
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 先頭列を初期化する
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // 状態遷移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a]
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* コイン両替 II：空間最適化した動的計画法 */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // dp テーブルを初期化
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // 状態遷移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a]
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

@main
enum CoinChangeII {
    /* Driver Code */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 5

        // 動的計画法
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("目標金額を作る硬貨の組み合わせ数は \(res)")

        // 空間最適化後の動的計画法
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("目標金額を作る硬貨の組み合わせ数は \(res)")
    }
}
