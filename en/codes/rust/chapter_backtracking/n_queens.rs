/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: N queens */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // When all rows are placed, record the solution
    if row == n {
        res.push(state.clone());
        return;
    }
    // Traverse all columns
    for col in 0..n {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Attempt: place the queen in this cell
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: restore this cell to an empty cell
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Solve N queens */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Record whether there is a queen in the column
    let mut diags1 = vec![false; 2 * n - 1]; // Record whether there is a queen on the main diagonal
    let mut diags2 = vec![false; 2 * n - 1]; // Record whether there is a queen on the anti-diagonal
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

    println!("Input board size is {n}");
    println!("Total queen placement solutions: {}", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
