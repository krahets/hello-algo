/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 硬貨の両替：動的計画法 */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // dp テーブルを初期化する
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 状態遷移：先頭行と先頭列
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状態遷移：残りの行と列
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 硬貨の両替：空間を最適化した動的計画法 */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // dp テーブルを初期化する
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a];
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* 実行用コード */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // 動的計画法
    int res = coinChangeDP(coins, amt);
    cout << "目標金額にするために必要な硬貨の最小枚数は " << res << endl;

    // 空間を最適化した動的計画法
    res = coinChangeDPComp(coins, amt);
    cout << "目標金額にするために必要な硬貨の最小枚数は " << res << endl;

    return 0;
}
