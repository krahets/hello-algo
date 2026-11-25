/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking: n-queens */
fn backtrack(
    row: usize,
    n: usize,
    state: &mut Vec<Vec<String>>,
    res: &mut Vec<Vec<Vec<String>>>,
    cols: &mut [bool],
    diags1: &mut [bool],
    diags2: &mut [bool],
) {
    // Record the solution once every row has a queen
    if row == n {
        res.push(state.clone());
        return;
    }
    // Try each column
    for col in 0..n {
        // Find the two diagonals through this square
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Prune if the column or either diagonal already has a queen
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Try placing a queen on this square
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: clear this square
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Solve the n-queens problem */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Track occupied columns
    let mut diags1 = vec![false; 2 * n - 1]; // Track occupied main diagonals
    let mut diags2 = vec![false; 2 * n - 1]; // Track occupied secondary diagonals
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

/* Driver code */
pub fn main() {
    let n: usize = 4;
    let res = n_queens(n);

    println!("Board side length: {n}");
    println!("Found {} queen arrangements", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
