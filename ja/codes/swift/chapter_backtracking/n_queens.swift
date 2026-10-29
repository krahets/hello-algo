/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バックトラッキング：n クイーン */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // すべての行への配置が終わったら、解を記録する
    if row == n {
        res.append(state)
        return
    }
    // すべての列を走査する
    for col in 0 ..< n {
        // このマスに対応する主対角線と副対角線を求める
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 試行：このマスにクイーンを配置する
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // 次の行に配置する
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // 復元：このマスを空きマスに戻す
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* n クイーン問題を解く */
func nQueens(n: Int) -> [[[String]]] {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // 列にクイーンがあるかどうかを記録する
    var diags1 = Array(repeating: false, count: 2 * n - 1) // 主対角線にクイーンがあるかどうかを記録する
    var diags2 = Array(repeating: false, count: 2 * n - 1) // 副対角線にクイーンがあるかどうかを記録する
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* 実行用コード */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("入力した盤面の縦横の長さは \(n)")
        print("クイーンの配置方法は全部で \(res.count) 通り")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
