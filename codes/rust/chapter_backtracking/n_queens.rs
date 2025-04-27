/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯算法：n 皇后 */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // 当放置完所有行时，记录解
    if row == n {
        res.push(state.clone());
        return;
    }
    // 遍历所有列
    for col in 0..n {
        // 计算该格子对应的主对角线和次对角线
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 尝试：将皇后放置在该格子
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：将该格子恢复为空位
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* 求解 n 皇后 */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // 记录列是否有皇后
    let mut diags1 = vec![false; 2 * n - 1]; // 记录主对角线上是否有皇后
    let mut diags2 = vec![false; 2 * n - 1]; // 记录次对角线上是否有皇后
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

    println!("输入棋盘长宽为 {n}");
    println!("皇后放置方案共有 {} 种", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
