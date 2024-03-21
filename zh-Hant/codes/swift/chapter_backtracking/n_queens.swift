/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯算法：n 皇后 */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // 当放置完所有行时，记录解
    if row == n {
        res.append(state)
        return
    }
    // 遍历所有列
    for col in 0 ..< n {
        // 计算该格子对应的主对角线和次对角线
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 尝试：将皇后放置在该格子
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // 放置下一行
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // 回退：将该格子恢复为空位
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* 求解 n 皇后 */
func nQueens(n: Int) -> [[[String]]] {
    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // 记录列是否有皇后
    var diags1 = Array(repeating: false, count: 2 * n - 1) // 记录主对角线上是否有皇后
    var diags2 = Array(repeating: false, count: 2 * n - 1) // 记录次对角线上是否有皇后
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

        print("输入棋盘长宽为 \(n)")
        print("皇后放置方案共有 \(res.count) 种")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
