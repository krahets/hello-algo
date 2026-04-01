/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 零钱兑换 II：动态规划 */
pub fn coin_change_ii_dp(coins: &[u32], amt: u32) -> u32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![vec![0; amt as usize + 1]; n + 1];
    // 初始化首列
    for row in &mut dp {
        row[0] = 1;
    }
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                dp[i][a as usize] = dp[i - 1][a as usize];
                continue;
            }
            // 不选和选硬币 i 这两种方案之和
            let no = dp[i - 1][a as usize];
            let yes = dp[i][(a - coins[i - 1]) as usize];
            dp[i][a as usize] = no + yes;
        }
    }
    dp[n][amt as usize]
}

/* 零钱兑换 II：空间优化后的动态规划 */
pub fn coin_change_ii_dp_comp(coins: &[u32], amt: u32) -> u32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![0; amt as usize + 1];
    dp[0] = 1;
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a {
                // 若超过目标金额，则不选硬币 i
                continue;
            }
            // 不选和选硬币 i 这两种方案之和
            let no = dp[a as usize];
            let yes = dp[(a - coins[i - 1]) as usize];
            dp[a as usize] = no + yes;
        }
    }
    dp[amt as usize]
}

/* Driver Code */
fn main() {
    let coins = [1, 2, 5];
    let amt = 5;

    // 动态规划
    let res = coin_change_ii_dp(&coins, amt);
    println!("凑出目标金额的硬币组合数量为 {res}");

    // 空间优化后的动态规划
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("凑出目标金额的硬币组合数量为 {res}");
}
