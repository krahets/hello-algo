/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // n段目に到達したとき、解の数に1を加える
    if (state == n)
        res[0]++;
    // すべての選択肢を走査
    for (auto &choice : choices) {
        // 剪定：n段を超えて登ることを許可しない
        if (state + choice > n)
            continue;
        // 試行：選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // 撤回
    }
}

/* 階段登り：バックトラッキング */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 1段または2段登ることを選択可能
    int state = 0;                // 0段目から登り始める
    vector<int> res = {0};        // res[0] を使用して解の数を記録
    backtrack(choices, state, n, res);
    return res[0];
}

/* ドライバーコード */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    return 0;
}