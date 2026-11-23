/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 0-1 ナップサック問題：全探索 */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if i == 0 || c == 0 {
        return 0;
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを返す
    std::cmp::max(no, yes)
}

/* 0-1 ナップサック問題：メモ化探索 */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if i == 0 || c == 0 {
        return 0;
    }
    // 記録済みなら、その値をそのまま返す
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを記録して返す
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* 0-1 ナップサック問題：動的計画法 */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* 0-1 ナップサック問題：空間を最適化した動的計画法 */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp テーブルを初期化する
    let mut dp = vec![0; cap + 1];
    // 状態遷移
    for i in 1..=n {
        // 逆順に走査する
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* 実行用コード */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // 全探索
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");

    // メモ化探索
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");

    // 動的計画法
    let res = knapsack_dp(&wgt, &val, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");

    // 空間を最適化した動的計画法
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("ナップサックの容量を超えない品物の最大価値は {res}");
}
