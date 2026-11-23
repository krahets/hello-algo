/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 階段を上る最小コスト：動的計画法 */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 部分問題の解を格納する dp テーブルを初期化する
    vector<int> dp(n + 1);
    // 初期状態：最小の部分問題の解を設定する
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 階段を上る最小コスト：空間を最適化した動的計画法 */
int minCostClimbingStairsDPComp(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* 実行用コード */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "入力した階段のコストのリスト ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "階段を上り終える最小コストは " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "階段を上り終える最小コストは " << res << endl;

    return 0;
}
