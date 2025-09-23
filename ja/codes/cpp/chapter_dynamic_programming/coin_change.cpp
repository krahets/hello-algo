/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 硬貨両替：動的プログラミング */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // DPテーブルを初期化
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 状態遷移：最初の行と最初の列
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状態遷移：残りの行と列
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選択しない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 選択しない場合と硬貨 i を選択する場合のより小さい値
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 硬貨両替：空間最適化動的プログラミング */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // DPテーブルを初期化
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選択しない
                dp[a] = dp[a];
            } else {
                // 選択しない場合と硬貨 i を選択する場合のより小さい値
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* ドライバーコード */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // 動的プログラミング
    int res = coinChangeDP(coins, amt);
    cout << "目標金額を作るのに必要な最小硬貨数は " << res << " です" << endl;

    // 空間最適化動的プログラミング
    res = coinChangeDPComp(coins, amt);
    cout << "目標金額を作るのに必要な最小硬貨数は " << res << " です" << endl;

    return 0;
}