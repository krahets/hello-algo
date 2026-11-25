/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 硬貨の両替 II：動的計画法 */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // dp テーブルを初期化する
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 先頭列を初期化する
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // 状態遷移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 目標金額を超える場合は硬貨 i を使わない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を使わない場合と使う場合の組合せ数を足す
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* 硬貨の両替 II：使用メモリを削減した動的計画法 */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // dp テーブルを初期化する
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // 状態遷移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 目標金額を超える場合は硬貨 i を使わない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を使わない場合と使う場合の組合せ数を足す
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* 実行例 */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // 動的計画法
    let res = coin_change_ii_dp(&coins, amt);
    println!("目標金額を作る硬貨の組合せ数は {res}");

    // 使用メモリを削減した動的計画法
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("目標金額を作る硬貨の組合せ数は {res}");
}
