/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 完全ナップサック：動的プログラミング */
int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // DPテーブルを初期化
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、アイテム i を選択しない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 選択しない場合とアイテム i を選択する場合のより大きい値
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 完全ナップサック：空間最適化動的プログラミング */
int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // DPテーブルを初期化
    vector<int> dp(cap + 1, 0);
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、アイテム i を選択しない
                dp[c] = dp[c];
            } else {
                // 選択しない場合とアイテム i を選択する場合のより大きい値
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* ドライバーコード */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    // 動的プログラミング
    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    // 空間最適化動的プログラミング
    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    return 0;
}