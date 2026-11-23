/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 制約付きの階段の上り方：動的計画法 */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // 部分問題の解を格納する dp テーブルを初期化する
    let mut dp = vec![vec![-1; 3]; n + 1];
    // 初期状態：最小の部分問題の解を設定する
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* 実行用コード */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
