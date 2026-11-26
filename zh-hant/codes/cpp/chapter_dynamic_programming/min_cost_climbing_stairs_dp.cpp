/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 爬樓梯的最低成本：動態規劃 */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 初始化 dp 表，用來儲存子問題的解
    vector<int> dp(n + 1);
    // 初始狀態：設定最小子問題的解
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 狀態轉移：從較小的子問題逐步求出較大子問題的解
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* 爬樓梯的最低成本：空間最佳化後的動態規劃 */
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

/* 主程式 */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "輸入的各階樓梯成本為 ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "爬完樓梯的最低成本為 " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "爬完樓梯的最低成本為 " << res << endl;

    return 0;
}
