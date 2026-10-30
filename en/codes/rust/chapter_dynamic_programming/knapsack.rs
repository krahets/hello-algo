/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 0-1 knapsack: brute-force search */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // If all items have been considered or no capacity remains, return value 0
    if i == 0 || c == 0 {
        return 0;
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Return the larger value from the two choices
    std::cmp::max(no, yes)
}

/* 0-1 knapsack: memoized search */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // If all items have been considered or no capacity remains, return value 0
    if i == 0 || c == 0 {
        return 0;
    }
    // If a result has already been recorded, return it directly
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // Record and return the larger value from the two choices
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* 0-1 knapsack: dynamic programming */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Initialize the dp table
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // State transitions
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* 0-1 knapsack: space-optimized dynamic programming */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // Initialize the dp table
    let mut dp = vec![0; cap + 1];
    // State transitions
    for i in 1..=n {
        // Traverse in decreasing order
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // Take the larger value obtained by excluding and including item i
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* Driver code */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // Brute-force search
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("Maximum total item value within the knapsack capacity: {res}");

    // Memoized search
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("Maximum total item value within the knapsack capacity: {res}");

    // Dynamic programming
    let res = knapsack_dp(&wgt, &val, cap);
    println!("Maximum total item value within the knapsack capacity: {res}");

    // Space-optimized dynamic programming
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("Maximum total item value within the knapsack capacity: {res}");
}
