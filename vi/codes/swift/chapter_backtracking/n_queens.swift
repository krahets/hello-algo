/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: N queens */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // When all rows are placed, record the solution
    if row == n {
        res.append(state)
        return
    }
    // Traverse all columns
    for col in 0 ..< n {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Attempt: place the queen in this cell
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Place the next row
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Backtrack: restore this cell to an empty cell
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Solve N queens */
func nQueens(n: Int) -> [[[String]]] {
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Record whether there is a queen in the column
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Record whether there is a queen on the main diagonal
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Record whether there is a queen on the anti-diagonal
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* Driver Code */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("Input board size is \(n)")
        print("Total queen placement solutions: \(res.count)")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
