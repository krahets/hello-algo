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
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* 硬貨の両替 II：空間を最適化した動的計画法 */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // dp テーブルを初期化する
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // 状態遷移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* 実行用コード */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // 動的計画法
    let res = coin_change_ii_dp(&coins, amt);
    println!("目標金額になる硬貨の組み合わせの数は {res}");

    // 空間を最適化した動的計画法
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("目標金額になる硬貨の組み合わせの数は {res}");
}
