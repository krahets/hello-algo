
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラッキング */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // 第 n 段に到達したら、方法数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を走査
    for (auto &choice : choices) {
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n)
            continue;
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 1 段または 2 段上ることを選べる
    int state = 0;                // 第 0 段から上り始める
    vector<int> res = {0};        // res[0] を使って方法数を記録する
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "階段を " << n << " 段上る方法は全部で " << res << " 通り" << endl;

    return 0;
}
