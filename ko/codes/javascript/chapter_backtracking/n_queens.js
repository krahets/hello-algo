/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 백트래킹: n-퀸 */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // 모든 행에 퀸을 놓으면 해를 기록한다
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // 모든 열을 순회한다
    for (let col = 0; col < n; col++) {
        // 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 이 칸에 퀸을 놓는다
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 다음 행에 퀸을 놓는다
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 되돌리기: 이 칸을 다시 비운다
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n-퀸 문제 풀기 */
function nQueens(n) {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 각 열에 퀸이 있는지 기록한다
    const diags1 = Array(2 * n - 1).fill(false); // 각 주대각선에 퀸이 있는지 기록한다
    const diags2 = Array(2 * n - 1).fill(false); // 각 부대각선에 퀸이 있는지 기록한다
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// 실행 코드
const n = 4;
const res = nQueens(n);

console.log(`입력 체스판의 한 변의 길이: ${n}`);
console.log(`퀸 배치 방법은 총 ${res.length}가지`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
