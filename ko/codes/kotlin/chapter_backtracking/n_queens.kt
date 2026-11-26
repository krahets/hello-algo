/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* 백트래킹: n-퀸 */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // 모든 행에 퀸을 놓으면 해를 기록한다
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // 모든 열을 순회한다
    for (col in 0..<n) {
        // 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 이 칸에 퀸을 놓는다
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // 다음 행에 퀸을 놓는다
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // 되돌리기: 이 칸을 다시 비운다
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* n-퀸 문제 풀기 */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // 각 열에 퀸이 있는지 기록한다
    val diags1 = BooleanArray(2 * n - 1) // 각 주대각선에 퀸이 있는지 기록한다
    val diags2 = BooleanArray(2 * n - 1) // 각 부대각선에 퀸이 있는지 기록한다
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* 실행 코드 */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("입력 체스판의 한 변의 길이: $n")
    println("퀸 배치 방법은 총 ${res.size}가지")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}