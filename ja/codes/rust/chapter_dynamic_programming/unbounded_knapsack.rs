/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 個数制限なしナップサック問題：動的計画法 */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp テーブルを初期化する
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // 状態遷移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 個数制限なしナップサック問題：空間を最適化した動的計画法 */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp テーブルを初期化する
    let mut dp = vec![0; cap + 1];
    // 状態遷移
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[c] = dp[c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* 実行用コード */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // 動的計画法
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");

    // 空間を最適化した動的計画法
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");
}
