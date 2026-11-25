/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：n 皇后 */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // 每一列都放好皇后後，記錄此解
    if row == n {
        res.append(state)
        return
    }
    // 逐一檢查各欄
    for col in 0 ..< n {
        // 計算這一格對應的主對角線與副對角線索引
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 嘗試：將皇后放在這一格
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // 在下一列放置皇后
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // 回溯：將這一格還原為空位
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* 求解 n 皇后問題 */
func nQueens(n: Int) -> [[[String]]] {
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // 記錄各欄是否已有皇后
    var diags1 = Array(repeating: false, count: 2 * n - 1) // 記錄各主對角線上是否已有皇后
    var diags2 = Array(repeating: false, count: 2 * n - 1) // 記錄各副對角線上是否已有皇后
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* 主程式 */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("輸入棋盤的邊長為 \(n)")
        print("皇后共有 \(res.count) 種擺法")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
