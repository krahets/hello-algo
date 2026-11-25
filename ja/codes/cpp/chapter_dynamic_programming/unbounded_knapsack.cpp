/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 個数制限なしナップサック問題：動的計画法 */
int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp テーブルを初期化する
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 容量を超える場合は品物 i を選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 個数制限なしナップサック問題：使用メモリを削減した動的計画法 */
int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // dp テーブルを初期化する
    vector<int> dp(cap + 1, 0);
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 容量を超える場合は品物 i を選ばない
                dp[c] = dp[c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 実行例 */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    // 動的計画法
    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "容量内でナップサックに入る品物の最大価値は " << res << endl;

    // 使用メモリを削減した動的計画法
    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "容量内でナップサックに入る品物の最大価値は " << res << endl;

    return 0;
}
