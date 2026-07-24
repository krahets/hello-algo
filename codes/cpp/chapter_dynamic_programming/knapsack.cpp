/**
 * File: knapsack.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

/* 0-1 背包：暴力搜索 */
int knapsackDFS(vector<int>& wgt, vector<int>& val, int i, int c) {
    // 已选完所有物品 或 背包无剩余容量，返回价值 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // 物品重量超过剩余容量，只能不选
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 不选当前物品 / 选当前物品，取价值更大的方案
    int no  = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    return max(no, yes);
}

/* 0-1 背包：记忆化搜索 */
int knapsackDFSMem(vector<int>& wgt, vector<int>& val, vector<vector<int>>& mem, int i, int c) {
    if (i == 0 || c == 0) {
        return 0;
    }
    // 已有记录，直接返回
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 物品超重，不选
    if (wgt[i - 1] > c) {
        mem[i][c] = knapsackDFSMem(wgt, val, mem, i - 1, c);
        return mem[i][c];
    }
    // 两种方案取最大价值
    int no  = knapsackDFSMem(wgt, val, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    
    mem[i][c] = max(no, yes);
    return mem[i][c];
}

/* 0-1 背包：动态规划 */
int knapsackDP(vector<int>& wgt, vector<int>& val, int cap) {
    int n = wgt.size();
    // dp[i][c] = 前 i 个物品，容量为 c 时的最大价值
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int c = 1; c <= cap; ++c) {
            if (wgt[i - 1] > c) {
                // 不选当前物品
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选 vs 选，取最大值
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 背包：空间优化后的动态规划（一维数组）*/
int knapsackDPComp(vector<int>& wgt, vector<int>& val, int cap) {
    int n = wgt.size();
    vector<int> dp(cap + 1, 0);

    // 遍历物品
    for (int i = 1; i <= n; ++i) {
        // 倒序遍历，防止重复选取（0-1 背包核心）
        for (int c = cap; c >= 1; --c) {
            if (wgt[i - 1] <= c) {
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 主函数测试 */
int main() {
    vector<int> wgt = {10, 20, 30, 40, 50};
    vector<int> val = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = wgt.size();

    // 暴力搜索
    int res = knapsackDFS(wgt, val, n, cap);
    cout << "暴力搜索    最大价值 = " << res << endl;

    // 记忆化搜索
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = knapsackDFSMem(wgt, val, mem, n, cap);
    cout << "记忆化搜索  最大价值 = " << res << endl;

    // 动态规划
    res = knapsackDP(wgt, val, cap);
    cout << "动态规划    最大价值 = " << res << endl;

    // 空间优化 DP
    res = knapsackDPComp(wgt, val, cap);
    cout << "优化 DP     最大价值 = " << res << endl;

    return 0;
}
