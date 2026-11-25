/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: n-queens */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // Record the solution once every row has a queen
    if row == n {
        res.append(state)
        return
    }
    // Try each column
    for col in 0 ..< n {
        // Find the two diagonals through this square
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Prune if the column or either diagonal already has a queen
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Try placing a queen on this square
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Place a queen in the next row
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Backtrack: clear this square
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Solve the n-queens problem */
func nQueens(n: Int) -> [[[String]]] {
    // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Track occupied columns
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Track occupied main diagonals
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Track occupied secondary diagonals
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

        print("Board side length: \(n)")
        print("Found \(res.count) queen arrangements")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
