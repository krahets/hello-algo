/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Coin change: dynamic programming */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Initialize the dp table
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // State transitions: first row and first column
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // State transitions: remaining rows and columns
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[n][amt] != max {
        return dp[n][amt] as i32;
    } else {
        -1
    }
}

/* Coin change: space-optimized dynamic programming */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Initialize the dp table
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // State transitions
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[amt] != max {
        return dp[amt] as i32;
    } else {
        -1
    }
}

/* Driver code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // Dynamic programming
    let res = coin_change_dp(&coins, amt);
    println!("Minimum number of coins needed to make the target amount: {res}");

    // Space-optimized dynamic programming
    let res = coin_change_dp_comp(&coins, amt);
    println!("Minimum number of coins needed to make the target amount: {res}");
}
