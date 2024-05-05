/*
 * File: n_queens.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: n queens */
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
        let mut copy_state: Vec<Vec<String>> = Vec::new();
        for s_row in state.clone() {
            copy_state.push(s_row);
        }
        res.push(copy_state);
        return;
    }
    // Traverse all columns
    for col in 0..n {
        // Calculate the main and minor diagonals corresponding to the cell
        let diag1 = row + n - 1 - col;
        let diag2 = row + col;
        // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Attempt: place the queen in the cell
            state.get_mut(row).unwrap()[col] = "Q".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Retract: restore the cell to an empty spot
            state.get_mut(row).unwrap()[col] = "#".into();
            (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
        }
    }
}

/* Solve n queens */
fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    let mut state: Vec<Vec<String>> = Vec::new();
    for _ in 0..n {
        let mut row: Vec<String> = Vec::new();
        for _ in 0..n {
            row.push("#".into());
        }
        state.push(row);
    }
    let mut cols = vec![false; n]; // Record columns with queens
    let mut diags1 = vec![false; 2 * n - 1]; // Record main diagonals with queens
    let mut diags2 = vec![false; 2 * n - 1]; // Record minor diagonals with queens
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

    println!("Input chessboard dimensions as {n}");
    println!("Total number of queen placement solutions = {}", res.len());
    for state in res.iter() {
        println!("--------------------");
        for row in state.iter() {
            println!("{:?}", row);
        }
    }
}
