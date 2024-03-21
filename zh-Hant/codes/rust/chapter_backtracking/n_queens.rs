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
    // 當放置完所有行時，記錄解
    if row == n {
        let mut copy_state: Vec<Vec<String>> = Vec::new();
        for s_row in state.clone() {
            copy_state.push(s_row);
        }
        res.push(copy_state);
        return;
    }
    // 走訪所有列
    for col in 0..n {
        // 計算該格子對應的主對角線和次對角線
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 嘗試：將皇后放置在該格子
            state.get_mut(row).unwrap()[col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：將該格子恢復為空位
            state.get_mut(row).unwrap()[col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* 求解 n 皇后 */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
    let mut state: Vec<Vec<String>> = Vec::new();
    for _ in 0..n {
        let mut row: Vec<String> = Vec::new();
        for _ in 0..n {
            row.push("#".into());
        }
        state.push(row);
    }
    let mut cols = vec![false; n]; // 記錄列是否有皇后
    let mut diags1 = vec![false; 2 * n - 1]; // 記錄主對角線上是否有皇后
    let mut diags2 = vec![false; 2 * n - 1]; // 記錄次對角線上是否有皇后
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

/* Driver Code */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("輸入棋盤長寬為 {n}");
    println!("皇后放置方案共有 {} 種", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
