/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 完全背包：动态规划 */
pub fn unbounded_knapsack_dp(wgt: &[u32], val: &[u32], cap: u32) -> u32 {
    let n = wgt.len();
    // 初始化 dp 表
    let mut dp = vec![vec![0; cap as usize + 1]; n + 1];
    // 状态转移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c {
                // 若超过背包容量，则不选物品 i
                dp[i][c as usize] = dp[i - 1][c as usize];
                continue;
            }
            // 不选和选物品 i 这两种方案的较大值
            let no = dp[i - 1][c as usize];
            let yes = dp[i][(c - wgt[i - 1]) as usize] + val[i - 1];
            dp[i][c as usize] = cmp::max(no, yes);
        }
    }
    dp[n][cap as usize]
}

/* 完全背包：空间优化后的动态规划 */
pub fn unbounded_knapsack_dp_comp(wgt: &[u32], val: &[u32], cap: u32) -> u32 {
    let n = wgt.len();
    // 初始化 dp 表
    let mut dp = vec![0; cap as usize + 1];
    // 状态转移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c {
                // 若超过背包容量，则不选物品 i
                continue;
            }
            // 不选和选物品 i 这两种方案的较大值
            let no = dp[c as usize];
            let yes = dp[(c - wgt[i - 1]) as usize] + val[i - 1];
            dp[c as usize] = cmp::max(no, yes);
        }
    }
    dp[cap as usize]
}

/* Driver Code */
fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap = 4;

    // 动态规划
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("不超过背包容量的最大物品价值为 {res}");

    // 空间优化后的动态规划
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("不超过背包容量的最大物品价值为 {res}");
}
