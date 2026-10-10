/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 0-1 knapsack: Brute-force search */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if i == 0 || c == 0 {
        return 0;
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Return the larger value of the two options
    std::cmp::max(no, yes)
}

/* 0-1 knapsack: Memoization search */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if i == 0 || c == 0 {
        return 0;
    }
    // If there's a record, return it directly
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Record and return the larger value of the two options
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* 0-1 knapsack: Dynamic programming */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* 0-1 knapsack: Space-optimized dynamic programming */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Initialize dp table
    let mut dp = vec![0; cap + 1];
    // State transition
    for i in 1..=n {
        // Traverse in reverse order
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // The larger value between not selecting and selecting item i
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver Code */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // Brute-force search
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");

    // Memoization search
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");

    // Dynamic programming
    let res = knapsack_dp(&wgt, &val, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");

    // Space-optimized dynamic programming
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("Maximum item value not exceeding knapsack capacity is {res}");
}
