#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;


/* 多重背包：暴力搜索 */
int multipleKnapsackDFS(vector<int> &wgt, vector<int> &val, vector<int> &cnt,
                        int i, int c) {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // 计算不放入和放入物品 i 的最大价值
    int no = multipleKnapsackDFS(wgt, val, cnt, i - 1, c);
    int ret = 0;
    // 尝试放 k 件第 i 个物品
    for (int k = 1; k <= cnt[i - 1]; k++) {
        int weight = k * wgt[i - 1];
        // 若超过背包容量，则只能选择不放入背包
        if (weight > c) {
            break;
        }
        int yes = multipleKnapsackDFS(wgt, val, cnt, i - 1, c - weight)
                 + k * val[i - 1];
        ret = max(no, yes);
    }
    return ret;
}

/* 多重背包：记忆化搜索 */
int multipleKnapsackDFSMem(vector<int> &wgt, vector<int> &val, vector<int> &cnt,
                           vector<vector<int>> &mem, int i, int c) {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i == 0 || c == 0) {
        return 0;
    }
    // 若已有记录，则直接返回
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 计算不放入和放入物品 i 的最大价值
    int no = multipleKnapsackDFSMem(wgt, val, cnt, mem, i - 1, c);

    // 选 k 件第 i 个物品
    for (int k = 1; k <= cnt[i - 1]; k++) {
        int weight = k * wgt[i - 1];
        // 若超过背包容量，则只能选择不放入背包
        if (weight > c) {
            break;
        }
        int yes = multipleKnapsackDFSMem(wgt, val, cnt, mem, i - 1, c - weight)
                 + k * val[i - 1];
        mem[i][c] = max(no, yes);
    }
    return mem[i][c];
}

/* 多重背包：动态规划 */
int multipleKnapsackDP(vector<int> &wgt, vector<int> &val, vector<int> &cnt,
                       int cap) {
    int n = wgt.size();
    // 初始化 dp 表
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int c = 0; c <= cap; c++) {
            // 不选第 i 个物品
            dp[i][c] = dp[i - 1][c];
            // 选 k 件第 i 个物品
            for (int k = 1; k <= cnt[i - 1]; k++) {
                int weight = k * wgt[i - 1];
                if (weight > c) {
                    break;
                }
                dp[i][c] = max(dp[i][c], dp[i - 1][c - weight] + k * val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 多重背包：空间优化后的动态规划 */
int multipleKnapsackDPComp(vector<int> &wgt, vector<int> &val, vector<int> &cnt,
                           int cap) {
    int n = wgt.size();
    // 初始化 dp 表
    vector<int> dp(cap + 1, 0);
    // 状态转移
    for (int i = 0; i < n; i++) {
        // 倒序遍历
        for (int c = cap; c >= 0; c--) {
            for (int k = 1; k <= cnt[i]; k++) {
                int weight = k * wgt[i];
                if (weight > c) break;
                dp[c] = max(dp[c], dp[c - weight] + k * val[i]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    vector<int> cnt = {2, 3, 1}; 
    int cap = 4;
    int n = wgt.size();

    // 暴力搜索
    int res = multipleKnapsackDFS(wgt, val, cnt, n, cap);
    cout << "不超过背包容量的最大物品价值为 " << res << endl;

    // 记忆化搜索
    vector<vector<int>> mem(n + 1, vector<int>(cap + 1, -1));
    res = multipleKnapsackDFSMem(wgt, val, cnt, mem, n, cap);
    cout << "不超过背包容量的最大物品价值为 " << res << endl;

    // 动态规划
    res = multipleKnapsackDP(wgt, val, cnt, cap);
    cout << "不超过背包容量的最大物品价值为 " << res << endl;

    // 空间优化后的动态规划
    res = multipleKnapsackDPComp(wgt, val, cnt, cap);
    cout << "不超过背包容量的最大物品价值为 " << res << endl;

    return 0;
}

