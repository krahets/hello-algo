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
    // Record a solution when a queen has been placed in every row
    if row == n {
        res.push(state.clone());
        return;
    }
    // Iterate over all columns
    for col in 0..n {
        // Calculate the main-diagonal and anti-diagonal indices for this square
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Try: place a queen on this square
            state[row][col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: restore this square to empty
            state[row][col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Solve the n-queens problem */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
    let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
    let mut cols = vec![false; n]; // Track whether a column contains a queen
    let mut diags1 = vec![false; 2 * n - 1]; // Track whether a main diagonal contains a queen
    let mut diags2 = vec![false; 2 * n - 1]; // Track whether an anti-diagonal contains a queen
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

    println!("The input board has width and height {n}");
    println!("Number of queen placements: {}", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
