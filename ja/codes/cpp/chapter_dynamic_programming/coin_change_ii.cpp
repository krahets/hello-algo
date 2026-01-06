/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 硬貨両替 II：動的プログラミング */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // DPテーブルを初期化
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 最初の列を初期化
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選択しない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 硬貨両替 II：空間最適化動的プログラミング */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // DPテーブルを初期化
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選択しない
                dp[a] = dp[a];
            } else {
                // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* ドライバーコード */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // 動的プログラミング
    int res = coinChangeIIDP(coins, amt);
    cout << "目標金額を作る硬貨の組み合わせ数は " << res << " です" << endl;

    // 空間最適化動的プログラミング
    res = coinChangeIIDPComp(coins, amt);
    cout << "目標金額を作る硬貨の組み合わせ数は " << res << " です" << endl;

    return 0;
}