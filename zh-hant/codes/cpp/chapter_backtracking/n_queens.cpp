/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯演算法：n 皇后 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // 每一列都放好皇后後，記錄此解
    if (row == n) {
        res.push_back(state);
        return;
    }
    // 逐一檢查各欄
    for (int col = 0; col < n; col++) {
        // 計算這一格對應的主對角線與副對角線索引
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放在這一格
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 在下一列放置皇后
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回溯：將這一格還原為空位
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后問題 */
vector<vector<vector<string>>> nQueens(int n) {
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // 記錄各欄是否已有皇后
    vector<bool> diags1(2 * n - 1, false); // 記錄各主對角線上是否已有皇后
    vector<bool> diags2(2 * n - 1, false); // 記錄各副對角線上是否已有皇后
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* 主程式 */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "輸入棋盤的邊長為 " << n << endl;
    cout << "皇后擺法共有 " << res.size() << " 種" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
