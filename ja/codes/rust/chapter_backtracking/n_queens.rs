/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* バックトラッキング：n クイーン */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // すべての行への配置が終わったら、解を記録する
    if row == n {
        res.push(state.clone());
        return;
    }
    // すべての列を走査する
    for col in 0..n {
        // このマスに対応する主対角線と副対角線を求める
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 試行：このマスにクイーンを配置する
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // 次の行に配置する
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 復元：このマスを空きマスに戻す
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* n クイーン問題を解く */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // 列にクイーンがあるかどうかを記録する
    let mut diags1 = vec![false; 2 * n - 1]; // 主対角線にクイーンがあるかどうかを記録する
    let mut diags2 = vec![false; 2 * n - 1]; // 副対角線にクイーンがあるかどうかを記録する
    let mut res: Vec<Vec<Vec<String>>> = Vec::new();

    backtrack(
        0,
        n,
        &mut state,
        &mut res,
        &mut cols,
        &mut diags1,
        &mut diags2,
    );

    res
}

/* 実行用コード */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("入力した盤面の縦横の長さは {n}");
    println!("クイーンの配置方法は全部で {} 通り", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
