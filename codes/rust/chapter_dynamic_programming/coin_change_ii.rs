/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 零钱兑换 II：动态规划 */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 初始化首列
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* 零钱兑换 II：空间优化后的动态规划 */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案之和
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

    // 动态规划
    let res = coin_change_ii_dp(&coins, amt);
    println!("凑出目标金额的硬币组合数量为 {res}");

    // 空间优化后的动态规划
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("凑出目标金额的硬币组合数量为 {res}");
}
