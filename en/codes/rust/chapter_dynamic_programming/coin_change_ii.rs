/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Coin change II: dynamic programming */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Initialize the dp table
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Initialize the first column
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // State transitions
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Add the numbers of ways without and with coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* Coin change II: space-optimized dynamic programming */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Initialize the dp table
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // State transitions
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Add the numbers of ways without and with coin i
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* Driver code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // Dynamic programming
    let res = coin_change_ii_dp(&coins, amt);
    println!("Number of coin combinations that make the target amount: {res}");

    // Space-optimized dynamic programming
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("Number of coin combinations that make the target amount: {res}");
}
