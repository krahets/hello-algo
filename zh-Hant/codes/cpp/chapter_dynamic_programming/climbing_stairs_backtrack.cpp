
/**
 * File: climbing_stairs_backtrack.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 回溯 */
void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
    // 當爬到第 n 階時，方案數量加 1
    if (state == n)
        res[0]++;
    // 走訪所有選擇
    for (auto &choice : choices) {
        // 剪枝：不允許越過第 n 階
        if (state + choice > n)
            continue;
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

/* 爬樓梯：回溯 */
int climbingStairsBacktrack(int n) {
    vector<int> choices = {1, 2}; // 可選擇向上爬 1 階或 2 階
    int state = 0;                // 從第 0 階開始爬
    vector<int> res = {0};        // 使用 res[0] 記錄方案數量
    backtrack(choices, state, n, res);
    return res[0];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    cout << "爬 " << n << " 階樓梯共有 " << res << " 種方案" << endl;

    return 0;
}
