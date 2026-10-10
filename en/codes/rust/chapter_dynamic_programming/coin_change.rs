/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Coin change: Dynamic programming */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Initialize dp table
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // State transition: first row and first column
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // State transition: rest of the rows and columns
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If exceeds target amount, don't select coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // The smaller value between not selecting and selecting coin i
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

/* Coin change: Space-optimized dynamic programming */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // Initialize dp table
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // State transition
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // If exceeds target amount, don't select coin i
                dp[a] = dp[a];
            } else {
                // The smaller value between not selecting and selecting coin i
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

/* Driver Code */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // Dynamic programming
    let res = coin_change_dp(&coins, amt);
    println!("Minimum coins needed to make target amount is {res}");

    // Space-optimized dynamic programming
    let res = coin_change_dp_comp(&coins, amt);
    println!("Minimum coins needed to make target amount is {res}");
}
