/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラック */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if state == n {
        res[0] = res[0] + 1;
    }
    // すべての選択肢を調べる
    for &choice in choices {
        // 枝刈り：n 段目を越えないようにする
        if state + choice > n {
            continue;
        }
        // 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 1 段または 2 段登れる
    let state = 0; // 0 段目から登り始める
    let mut res = Vec::new();
    res.push(0); // res[0] に登り方の数を記録する
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* 実行例 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("全 {n} 段の階段の登り方は {res} 通り");
}
