/*
 * File: min_cost_climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 階段登りの最小コスト：動的計画法 */
fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    }
    // 部分問題の解を保存するために dp テーブルを初期化
    let mut dp = vec![-1; n + 1];
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for i in 3..=n {
        dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    dp[n]
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    };
    let (mut a, mut b) = (cost[1], cost[2]);
    for i in 3..=n {
        let tmp = b;
        b = cmp::min(a, tmp) + cost[i];
        a = tmp;
    }
    b
}

/* Driver Code */
pub fn main() {
    let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
    println!("入力された階段コストのリストは {:?}", &cost);

    let res = min_cost_climbing_stairs_dp(&cost);
    println!("階段を上り切る最小コストは {res}");

    let res = min_cost_climbing_stairs_dp_comp(&cost);
    println!("階段を上り切る最小コストは {res}");
}
