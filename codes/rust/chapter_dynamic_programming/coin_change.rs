/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 零钱兑换：动态规划 */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // 初始化 dp 表
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 状态转移：首行首列
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // 状态转移：其余行和列
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
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

/* 零钱兑换：空间优化后的动态规划 */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // 初始化 dp 表
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // 状态转移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
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

    // 动态规划
    let res = coin_change_dp(&coins, amt);
    println!("凑到目标金额所需的最少硬币数量为 {res}");

    // 空间优化后的动态规划
    let res = coin_change_dp_comp(&coins, amt);
    println!("凑到目标金额所需的最少硬币数量为 {res}");
}
