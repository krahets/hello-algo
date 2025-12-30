/**
 * File: coin_change_ii.swift
 * Created Time: 2023-07-16
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Coin change II: Dynamic programming */
func coinChangeIIDP(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // Initialize dp table
    var dp = Array(repeating: Array(repeating: 0, count: amt + 1), count: n + 1)
    // Initialize first column
    for i in 0 ... n {
        dp[i][0] = 1
    }
    // State transition
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a]
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* Coin change II: Space-optimized dynamic programming */
func coinChangeIIDPComp(coins: [Int], amt: Int) -> Int {
    let n = coins.count
    // Initialize dp table
    var dp = Array(repeating: 0, count: amt + 1)
    dp[0] = 1
    // State transition
    for i in 1 ... n {
        for a in 1 ... amt {
            if coins[i - 1] > a {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a]
            } else {
                // Sum of the two options: not selecting and selecting coin i
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

        // Dynamic programming
        var res = coinChangeIIDP(coins: coins, amt: amt)
        print("Number of coin combinations to make target amount is \(res)")

        // Space-optimized dynamic programming
        res = coinChangeIIDPComp(coins: coins, amt: amt)
        print("Number of coin combinations to make target amount is \(res)")
    }
}
