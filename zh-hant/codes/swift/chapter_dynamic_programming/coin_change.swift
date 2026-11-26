/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 零錢兌換：動態規劃 */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 狀態轉移：第一列和第一欄
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // 狀態轉移：其餘各列與各欄
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 取不選與選取硬幣 i 兩種情況中的較小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* 零錢兌換：空間最佳化後的動態規劃 */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // 初始化 dp 表
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // 狀態轉移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a]
            } else {
                // 取不選與選取硬幣 i 兩種情況中的較小值
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* 主程式 */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // 動態規劃
        var res = coinChangeDP(coins: coins, amt: amt)
        print("湊出目標金額所需的最少硬幣數為 \(res)")

        // 空間最佳化後的動態規劃
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("湊出目標金額所需的最少硬幣數為 \(res)")
    }
}
