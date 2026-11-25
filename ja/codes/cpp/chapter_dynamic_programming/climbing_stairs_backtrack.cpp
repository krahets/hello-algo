
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* バックトラック */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を調べる
    for (auto &choice : choices) {
        // 枝刈り：n 段目を越えないようにする
        if (state + choice > n)
            continue;
        // 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 1 段または 2 段登れる
    int state = 0;                // 0 段目から登り始める
    vector<int> res = {0};        // res[0] に登り方の数を記録する
    backtrack(choices, state, n, res);
    return res[0];
}

/* 実行例 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "全 " << n << " 段の階段の登り方は " << res << " 通り" << endl;

    return 0;
}
