/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

/* 打印数组 */
void printVector(const vector<int>& v) {
    cout << "[ ";
    for (int x : v)
        cout << x << " ";
    cout << "]" << endl;
}

/* 爬楼梯最小代价：动态规划 */
int minCostClimbingStairsDP(vector<int>& cost) {
    int n = cost.size();
    if (n == 2)
        return min(cost[0], cost[1]);

    vector<int> dp(n);
    dp[0] = cost[0];
    dp[1] = cost[1];

    for (int i = 2; i < n; ++i) {
        dp[i] = min(dp[i-1], dp[i-2]) + cost[i];
    }

    return min(dp[n-1], dp[n-2]);
}

/* 爬楼梯最小代价：空间优化 DP（O(1) 空间） */
int minCostClimbingStairsDPComp(vector<int>& cost) {
    int n = cost.size();
    if (n == 2)
        return min(cost[0], cost[1]);

    int a = cost[0];
    int b = cost[1];

    for (int i = 2; i < n; ++i) {
        int cur = min(a, b) + cost[i];
        a = b;
        b = cur;
    }

    return min(a, b);
}

/* 主函数测试 */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};

    cout << "楼梯代价列表：";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "动态规划       最低代价：" << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "空间优化 DP    最低代价：" << res << endl;

    return 0;
}
