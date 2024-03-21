/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：n 皇后 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // 當放置完所有行時，記錄解
    if (row == n) {
        res.push_back(state);
        return;
    }
    // 走訪所有列
    for (int col = 0; col < n; col++) {
        // 計算該格子對應的主對角線和次對角線
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放置在該格子
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：將該格子恢復為空位
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后 */
vector<vector<vector<string>>> nQueens(int n) {
    // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // 記錄列是否有皇后
    vector<bool> diags1(2 * n - 1, false); // 記錄主對角線上是否有皇后
    vector<bool> diags2(2 * n - 1, false); // 記錄次對角線上是否有皇后
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "輸入棋盤長寬為 " << n << endl;
    cout << "皇后放置方案共有 " << res.size() << " 種" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
