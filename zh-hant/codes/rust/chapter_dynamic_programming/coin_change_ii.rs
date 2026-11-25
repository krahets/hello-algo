/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 零錢兌換 II：動態規劃 */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 初始化第一欄
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // 狀態轉移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* 零錢兌換 II：空間最佳化後的動態規劃 */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // 初始化 dp 表
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // 狀態轉移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a];
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* 主程式 */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // 動態規劃
    let res = coin_change_ii_dp(&coins, amt);
    println!("湊出目標金額的硬幣組合數為 {res}");

    // 空間最佳化後的動態規劃
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("湊出目標金額的硬幣組合數為 {res}");
}
