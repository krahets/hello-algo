/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: n queens */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // When all rows are placed, record the solution
    if row == n {
        res.append(state)
        return
    }
    // Traverse all columns
    for col in 0 ..< n {
        // Calculate the main and minor diagonals corresponding to the cell
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Attempt: place the queen in the cell
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Place the next row
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Retract: restore the cell to an empty spot
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Solve n queens */
func nQueens(n: Int) -> [[[String]]] {
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Record columns with queens
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Record main diagonals with queens
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Record minor diagonals with queens
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

        print("Enter chessboard dimensions as \(n)")
        print("Total \(res.count) queen placement solutions")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
