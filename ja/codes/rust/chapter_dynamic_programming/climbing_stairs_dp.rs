/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 階段の上り方：動的計画法 */
fn climbing_stairs_dp(n: usize) -> i32 {
    // dp[1] と dp[2] は既知なので、その値を返す
    if n == 1 || n == 2 {
        return n as i32;
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    let mut dp = vec![-1; n + 1];
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* 階段の上り方：空間を最適化した動的計画法 */
fn climbing_stairs_dp_comp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return n as i32;
    }
    let (mut a, mut b) = (1, 2);
    for _ in 3..=n {
        let tmp = b;
        b = a + b;
        a = tmp;
    }
    b
}

/* 実行用コード */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");

    let res = climbing_stairs_dp_comp(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
