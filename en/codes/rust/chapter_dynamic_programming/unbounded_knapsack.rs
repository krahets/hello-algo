/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Unbounded knapsack: Dynamic programming */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Initialize dp table
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // State transition
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // If exceeds knapsack capacity, don't select item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The larger value between not selecting and selecting item i
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Unbounded knapsack: Space-optimized dynamic programming */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Initialize dp table
    let mut dp = vec![0; cap + 1];
    // State transition
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // If exceeds knapsack capacity, don't select item i
                dp[c] = dp[c];
            } else {
                // The larger value between not selecting and selecting item i
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // Dynamic programming
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");

    // Space-optimized dynamic programming
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");
}
