/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 硬貨の両替：動的計画法 */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // dp テーブルを初期化する
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 状態遷移：先頭行と先頭列
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // 状態遷移：残りの行と列
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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

/* 硬貨の両替：空間を最適化した動的計画法 */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // dp テーブルを初期化する
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // 状態遷移
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
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

/* 実行用コード */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // 動的計画法
    let res = coin_change_dp(&coins, amt);
    println!("目標金額にするために必要な硬貨の最小枚数は {res}");

    // 空間を最適化した動的計画法
    let res = coin_change_dp_comp(&coins, amt);
    println!("目標金額にするために必要な硬貨の最小枚数は {res}");
}
