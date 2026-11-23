/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // n 段目に到達したら、方法の数を 1 増やす
    if state == n {
        res[0] = res[0] + 1;
    }
    // すべての選択肢を走査する
    for &choice in choices {
        // 枝刈り：n 段目を越えてはならない
        if state + choice > n {
            continue;
        }
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 1 段または 2 段上ることを選択できる
    let state = 0; // 0 段目から上り始める
    let mut res = Vec::new();
    res.push(0); // res[0] に方法の数を記録する
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* 実行用コード */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
