
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // n 段目に到達したら、方法の数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を走査する
    for (auto &choice : choices) {
        // 枝刈り：n 段目を越えてはならない
        if (state + choice > n)
            continue;
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 1 段または 2 段上ることを選択できる
    int state = 0;                // 0 段目から上り始める
    vector<int> res = {0};        // res[0] に方法の数を記録する
    backtrack(choices, state, n, res);
    return res[0];
}

/* 実行用コード */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "上る段数： " << n << " 段、上り方は全部で " << res << " 通り" << endl;

    return 0;
}
