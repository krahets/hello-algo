/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 最小コスト階段登り：動的プログラミング */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // DPテーブルを初期化し、部分問題の解を格納するために使用
    vector<int> dp(n + 1);
    // 初期状態：最小の部分問題の解を事前設定
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 状態遷移：小さな問題から大きな部分問題を段階的に解く
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 最小コスト階段登り：空間最適化動的プログラミング */
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

/* ドライバーコード */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "階段のコストリストを [";
    for (int i = 0; i < cost.size(); i++) {
        cout << cost[i];
        if (i < cost.size() - 1) cout << ", ";
    }
    cout << "] として入力" << endl;

    int res = minCostClimbingStairsDP(cost);
    cout << "階段を登るための最小コスト " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "階段を登るための最小コスト " << res << endl;

    return 0;
}