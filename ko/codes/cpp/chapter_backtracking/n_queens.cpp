/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹: n-퀸 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // 모든 행에 퀸을 놓으면 해를 기록한다
    if (row == n) {
        res.push_back(state);
        return;
    }
    // 모든 열을 순회한다
    for (int col = 0; col < n; col++) {
        // 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 이 칸에 퀸을 놓는다
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 다음 행에 퀸을 놓는다
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 되돌리기: 이 칸을 다시 비운다
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n-퀸 문제 풀기 */
vector<vector<vector<string>>> nQueens(int n) {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // 각 열에 퀸이 있는지 기록한다
    vector<bool> diags1(2 * n - 1, false); // 각 주대각선에 퀸이 있는지 기록한다
    vector<bool> diags2(2 * n - 1, false); // 각 부대각선에 퀸이 있는지 기록한다
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* 실행 코드 */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "입력 체스판의 한 변의 길이: " << n << endl;
    cout << "퀸 배치 방법은 총 " << res.size() << " 가지" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
