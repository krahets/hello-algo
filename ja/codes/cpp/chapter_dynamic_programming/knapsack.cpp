/**
 * File: knapsack.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 0-1 ナップサック：ブルートフォース探索 */
int knapsackDFS(vector<int> &wgt, vector<int> &val, int i, int c) {
    // すべてのアイテムが選択されたか、ナップサックに残り容量がない場合、値 0 を返す
    if (i == 0 || c == 0) {
        return 0;
    }
    // ナップサックの容量を超える場合、ナップサックに入れないことしか選択できない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // アイテム i を入れない場合と入れる場合の最大値を計算
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2つの選択肢のより大きい値を返す
    return max(no, yes);
}

/* 0-1 ナップサック：動的プログラミング */
int knapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 ナップサック：空間最適化動的プログラミング */
int knapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // DPテーブルを初期化
    vector<int> dp(cap + 1, 0);
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        // 逆順で走査
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 選択しない場合とアイテム i を選択する場合のより大きい値
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* ドライバーコード */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // ブルートフォース探索
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    // 動的プログラミング
    res = knapsackDP(wgt, val, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    // 空間最適化動的プログラミング
    res = knapsackDPComp(wgt, val, cap);
    cout << "ナップサック容量内での最大値は " << res << " です" << endl;

    return 0;
}