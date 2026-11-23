/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 백트래킹 알고리즘: n-퀸 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // 모든 행에 배치했으면 해를 기록한다
    if (row == n) {
        res.push_back(state);
        return;
    }
    // 모든 열을 순회한다
    for (int col = 0; col < n; col++) {
        // 해당 칸이 속한 주대각선과 부대각선을 계산한다
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 해당 칸에 퀸을 놓는다
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 다음 행에 배치한다
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 되돌리기: 해당 칸을 빈칸으로 되돌린다
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n-퀸 문제 풀기 */
vector<vector<vector<string>>> nQueens(int n) {
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // 열에 퀸이 있는지 기록한다
    vector<bool> diags1(2 * n - 1, false); // 주대각선에 퀸이 있는지 기록한다
    vector<bool> diags2(2 * n - 1, false); // 부대각선에 퀸이 있는지 기록한다
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* 실행 코드 */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "입력한 체스판의 가로와 세로 길이: " << n << endl;
    cout << "퀸을 배치하는 방법은 총 " << res.size() << " 가지이다" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
