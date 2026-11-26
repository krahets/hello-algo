/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングによる n クイーン問題 */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // すべての行に置いたら解を記録する
    if (row == n) {
        res.push_back(state);
        return;
    }
    // すべての列を調べる
    for (int col = 0; col < n; col++) {
        // このマスを通る主対角線と副対角線を求める
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：このマスにクイーンを置く
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 次の行に置く
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 後戻り：このマスを空きに戻す
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n クイーン問題を解く */
vector<vector<vector<string>>> nQueens(int n) {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // 各列にクイーンがあるか記録する
    vector<bool> diags1(2 * n - 1, false); // 各主対角線にクイーンがあるか記録する
    vector<bool> diags2(2 * n - 1, false); // 各副対角線にクイーンがあるか記録する
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* 実行例 */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "盤面の一辺の長さ： " << n << endl;
    cout << "クイーンの配置は全部で " << res.size() << " 通り" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
