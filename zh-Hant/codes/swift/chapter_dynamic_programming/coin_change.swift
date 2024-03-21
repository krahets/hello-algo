/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 零钱兑换：动态规划 */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // 初始化 dp 表
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // 状态转移：首行首列
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // 状态转移：其余行和列
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* 零钱兑换：空间优化后的动态规划 */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // 初始化 dp 表
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // 状态转移
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a]
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* Driver Code */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // 动态规划
        var res = coinChangeDP(coins: coins, amt: amt)
        print("凑到目标金额所需的最少硬币数量为 \(res)")

        // 空间优化后的动态规划
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("凑到目标金额所需的最少硬币数量为 \(res)")
    }
}
