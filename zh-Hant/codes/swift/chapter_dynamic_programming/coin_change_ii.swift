/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 零钱兑换 II：动态规划 */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 初始化首列
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // 状态转移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 零钱兑换 II：空间优化后的动态规划 */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // 初始化 dp 表
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // 状态转移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a]
            } else {
                // 不选和选硬币 i 这两种方案之和
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

        // 动态规划
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("凑出目标金额的硬币组合数量为 \(res)")

        // 空间优化后的动态规划
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("凑出目标金额的硬币组合数量为 \(res)")
    }
}
