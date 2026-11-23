/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹 알고리즘: n-퀸 */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // 모든 행에 배치했으면 해를 기록한다
    if row == n {
        res.append(state)
        return
    }
    // 모든 열을 순회한다
    for col in 0 ..< n {
        // 해당 칸이 속한 주대각선과 부대각선을 계산한다
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 시도: 해당 칸에 퀸을 놓는다
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // 다음 행에 배치한다
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // 되돌리기: 해당 칸을 빈칸으로 되돌린다
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* n-퀸 문제 풀기 */
func nQueens(n: Int) -> [[[String]]] {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // 열에 퀸이 있는지 기록한다
    var diags1 = Array(repeating: false, count: 2 * n - 1) // 주대각선에 퀸이 있는지 기록한다
    var diags2 = Array(repeating: false, count: 2 * n - 1) // 부대각선에 퀸이 있는지 기록한다
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* 실행 코드 */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("입력 체스판의 가로와 세로 길이 = \(n)")
        print("퀸을 배치하는 방법은 총 \(res.count)가지이다")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
