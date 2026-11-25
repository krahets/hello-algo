
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯 */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // 爬到第 n 階時，將走法數加 1
    if (state == n)
        res[0]++;
    // 走訪所有選項
    for (auto &choice : choices) {
        // 剪枝：不能越過第 n 階
        if (state + choice > n)
            continue;
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 撤銷選擇
    }
}

/* 爬樓梯：回溯法 */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 每次可以往上爬 1 階或 2 階
    int state = 0;                // 從第 0 階開始爬
    vector<int> res = {0};        // 用 res[0] 記錄走法數
    backtrack(choices, state, n, res);
    return res[0];
}

/* 主程式 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "爬 " << n << " 階樓梯共有 " << res << " 種走法" << endl;

    return 0;
}
