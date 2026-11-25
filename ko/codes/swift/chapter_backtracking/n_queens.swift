/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 백트래킹: n-퀸 */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // 모든 행에 퀸을 놓으면 해를 기록한다
    if row == n {
        res.append(state)
        return
    }
    // 모든 열을 순회한다
    for col in 0 ..< n {
        // 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // 시도: 이 칸에 퀸을 놓는다
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // 다음 행에 퀸을 놓는다
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // 되돌리기: 이 칸을 다시 비운다
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* n-퀸 문제 풀기 */
func nQueens(n: Int) -> [[[String]]] {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // 각 열에 퀸이 있는지 기록한다
    var diags1 = Array(repeating: false, count: 2 * n - 1) // 각 주대각선에 퀸이 있는지 기록한다
    var diags2 = Array(repeating: false, count: 2 * n - 1) // 각 부대각선에 퀸이 있는지 기록한다
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

        print("입력 체스판의 한 변의 길이: \(n)")
        print("퀸 배치 방법은 총 \(res.count)가지")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
