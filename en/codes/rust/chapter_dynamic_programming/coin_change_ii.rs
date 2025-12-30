/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Coin change II: Dynamic programming */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Initialize dp table
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // Initialize first column
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // State transition
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* Coin change II: Space-optimized dynamic programming */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // Initialize dp table
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // State transition
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // Sum of the two options: not selecting and selecting coin i
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* Driver Code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // Dynamic programming
    let res = coin_change_ii_dp(&coins, amt);
    println!("Number of coin combinations to make target amount is {res}");

    // Space-optimized dynamic programming
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("Number of coin combinations to make target amount is {res}");
}
