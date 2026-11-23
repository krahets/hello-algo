/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: n-queens */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // Record a solution when a queen has been placed in every row
    if row == n {
        res.append(state)
        return
    }
    // Iterate over all columns
    for col in 0 ..< n {
        // Calculate the main-diagonal and anti-diagonal indices for this square
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Try: place a queen on this square
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Place a queen in the next row
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Backtrack: restore this square to empty
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Solve the n-queens problem */
func nQueens(n: Int) -> [[[String]]] {
    // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Track whether a column contains a queen
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Track whether a main diagonal contains a queen
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Track whether an anti-diagonal contains a queen
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* Driver code */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("Input board width and height: \(n)")
        print("There are \(res.count) queen placements")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
