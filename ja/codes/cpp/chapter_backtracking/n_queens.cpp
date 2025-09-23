/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキングアルゴリズム：n クイーン */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // すべての行が配置されたら、解を記録
    if (row == n) {
        res.push_back(state);
        return;
    }
    // すべての列を走査
    for (int col = 0; col < n; col++) {
        // セルに対応する主対角線と副対角線を計算
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪定：セルの列、主対角線、副対角線にクイーンを配置することを許可しない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：セルにクイーンを配置
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 次の行を配置
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：セルを空のスポットに復元
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n クイーンを解く */
vector<vector<vector<string>>> nQueens(int n) {
    // n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // クイーンのある列を記録
    vector<bool> diags1(2 * n - 1, false); // クイーンのある主対角線を記録
    vector<bool> diags2(2 * n - 1, false); // クイーンのある副対角線を記録
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* ドライバーコード */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "チェスボードの次元を " << n << " として入力" << endl;
    cout << "クイーン配置解の総数 = " << res.size() << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}