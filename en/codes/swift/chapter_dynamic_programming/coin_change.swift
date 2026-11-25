/**
 * File: coin_change.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Coin change with dynamic programming */
func coinChangeDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Initialize the dp table
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // State transitions for the first row and column
    for a in 1 ... amt {
        dp[0][a] = MAX
    }
    // State transitions for the remaining rows and columns
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Skip coin i if its value exceeds the target amount
                dp[i][a] = dp[i - 1][a]
            } else {
                // Take the minimum of the counts for skipping and taking coin i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1
}

/* Coin change with space-optimized dynamic programming */
func coinChangeDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    let MAX = amt + 1
    // Initialize the dp table
    var dp = Array(repeating: MAX, count: amt + 1)
    dp[0] = 0
    // State transition
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // Skip coin i if its value exceeds the target amount
                dp[a] = dp[a]
            } else {
                // Take the minimum of the counts for skipping and taking coin i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1
}

@main
enum CoinChange {
    /* Driver code */
    static func main() {
        let coins = [1, 2, 5]
        let amt = 4

        // Dynamic programming
        var res = coinChangeDP(coins: coins, amt: amt)
        print("Minimum number of coins needed to make the target amount: \(res)")

        // Space-optimized dynamic programming
        res = coinChangeDPComp(coins: coins, amt: amt)
        print("Minimum number of coins needed to make the target amount: \(res)")
    }
}
