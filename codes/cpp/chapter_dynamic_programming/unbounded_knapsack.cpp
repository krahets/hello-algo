/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

/* 完全背包：动态规划（二维 DP）*/
int unboundedKnapsackDP(vector<int>& wgt, vector<int>& val, int cap) {
    int n = wgt.size();
    // dp[i][c] 表示前 i 种物品，容量 c 的最大价值
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int c = 1; c <= cap; ++c) {
            if (wgt[i - 1] > c) {
                // 物品超重，不选
                dp[i][c] = dp[i - 1][c];
            } else {
                // 完全背包：可重复选，因此使用 dp[i] 而非 dp[i-1]
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 完全背包：空间优化后的动态规划（一维 DP）*/
int unboundedKnapsackDPComp(vector<int>& wgt, vector<int>& val, int cap) {
    int n = wgt.size();
    vector<int> dp(cap + 1, 0);

    // 正序遍历容量 = 完全背包（可重复选取）
    for (int i = 1; i <= n; ++i) {
        for (int c = 1; c <= cap; ++c) {
            if (wgt[i - 1] <= c) {
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 主函数测试 */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "[二维动态规划] 不超过背包容量的最大物品价值 = " << res << endl;

    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "[一维优化 DP] 不超过背包容量的最大物品价值 = " << res << endl;

    return 0;
}
