/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // 第 n 段に到達したら、方法数を 1 増やす
    if state == n {
        res[0] = res[0] + 1;
    }
    // すべての選択肢を走査
    for &choice in choices {
        // 枝刈り: 第 n 段を超えないようにする
        if state + choice > n {
            continue;
        }
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 1 段または 2 段上ることを選べる
    let state = 0; // 第 0 段から上り始める
    let mut res = Vec::new();
    res.push(0); // res[0] を使って方法数を記録する
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("{n} 段の階段を上る方法は全部で {res} 通り");
}
