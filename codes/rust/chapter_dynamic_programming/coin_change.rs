/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 零钱兑换：动态规划 */
pub fn coin_change_dp(coins: &[u32], amt: u32) -> Option<u32> {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![vec![Some(0); amt as usize + 1]; n + 1];
    // 状态转移：首行
    for a in 1..=amt {
        dp[0][a as usize] = None;
    }
    // 状态转移：其余行
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[i][a as usize] = dp[i - 1][a as usize];
                continue;
            }
            // 不选和选硬币 i 这两种方案的较小值
            let no = dp[i - 1][a as usize];
            let yes = dp[i][(a - coins[i - 1]) as usize].map(|x| x + 1);
            if let (Some(no), Some(yes)) = (no, yes) {
                dp[i][a as usize] = Some(cmp::min(no, yes));
            } else {
                dp[i][a as usize] = no.or(yes);
            }
        }
    }
    // 返回 None 表示无法凑出目标金额
    dp[n][amt as usize]
}

/* 零钱兑换：空间优化后的动态规划 */
pub fn coin_change_dp_comp(coins: &[u32], amt: u32) -> Option<u32> {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![None; amt as usize + 1];
    dp[0] = Some(0);
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                continue;
            }
            // 不选和选硬币 i 这两种方案的较小值
            let no = dp[a as usize];
            let yes = dp[(a - coins[i - 1]) as usize].map(|x| x + 1);
            if let (Some(no), Some(yes)) = (no, yes) {
                dp[a as usize] = Some(cmp::min(no, yes));
            } else {
                dp[a as usize] = no.or(yes);
            }
        }
    }
    // 返回 None 表示无法凑出目标金额
    dp[amt as usize]
}

/* Driver Code */
fn main() {
    let coins = [1, 2, 5];
    let amt = 4;

    // 动态规划
    let res = coin_change_dp(&coins, amt);
    println!("凑到目标金额所需的最少硬币数量为 {res:?}");

    // // 空间优化后的动态规划
    let res = coin_change_dp_comp(&coins, amt);
    println!("凑到目标金额所需的最少硬币数量为 {res:?}");
}
