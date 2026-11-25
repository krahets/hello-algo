/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 零錢兌換 II：動態規劃 */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 初始化第一欄
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // 狀態轉移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 零錢兌換 II：空間最佳化後的動態規劃 */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // 狀態轉移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a]
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

@main
enum CoinChangeII {
    /* 主程式 */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 5

        // 動態規劃
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("湊出目標金額的硬幣組合數為 \(res)")

        // 空間最佳化後的動態規劃
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("湊出目標金額的硬幣組合數為 \(res)")
    }
}
