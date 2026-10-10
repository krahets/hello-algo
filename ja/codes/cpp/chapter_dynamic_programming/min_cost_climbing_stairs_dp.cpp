/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 階段登りの最小コスト：動的計画法 */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 部分問題の解を保存するために dp テーブルを初期化
    vector<int> dp(n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 階段昇りの最小コスト：空間最適化後の動的計画法 */
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

/* Driver Code */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "入力された階段コストのリストは ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "階段を上り切る最小コストは " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "階段を上り切る最小コストは " << res << endl;

    return 0;
}
