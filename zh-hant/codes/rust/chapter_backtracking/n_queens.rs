/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：n 皇后 */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // 每一列都放好皇后後，記錄此解
    if row == n {
        res.push(state.clone());
        return;
    }
    // 逐一檢查各欄
    for col in 0..n {
        // 計算這一格對應的主對角線與副對角線索引
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 嘗試：將皇后放在這一格
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // 在下一列放置皇后
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回溯：將這一格還原為空位
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* 求解 n 皇后問題 */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // 記錄各欄是否已有皇后
    let mut diags1 = vec![false; 2 * n - 1]; // 記錄各主對角線上是否已有皇后
    let mut diags2 = vec![false; 2 * n - 1]; // 記錄各副對角線上是否已有皇后
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

/* 主程式 */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("輸入棋盤的邊長為 {n}");
    println!("皇后共有 {} 種擺法", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
