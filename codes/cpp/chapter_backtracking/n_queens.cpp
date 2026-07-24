/**
 * File: n_queens.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <string>
using namespace std;

/* 打印一维向量（行）*/
void printVector(const vector<string>& vec) {
    for (const string& s : vec) {
        cout << s << " ";
    }
    cout << endl;
}

/* 回溯算法：n 皇后 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // 放置完所有行，记录解
    if (row == n) {
        res.push_back(state);
        return;
    }
    // 遍历所有列
    for (int col = 0; col < n; col++) {
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：列、主对角线、副对角线都不能有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 放置皇后
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;

            // 下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);

            // 回溯撤销
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后 */
vector<vector<vector<string>>> nQueens(int n) {
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);
    vector<bool> diags1(2 * n - 1, false);
    vector<bool> diags2(2 * n - 1, false);
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "棋盘大小 = " << n << endl;
    cout << "解法总数 = " << res.size() <<  " 种" << endl;

    for (const auto& board : res) {
        cout << "---------------------" << endl;
        for (const auto& row : board) {
            printVector(row);
        }
    }

    return 0;
}
