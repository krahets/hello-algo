/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 零钱兑换 II：暴力搜索 */
int coinChangeIIDFS(const vector<int> &coins, int start, int amt) {
    // 1. 如果刚好凑出 0，找到一种可行组合
    if (amt == 0) {
        return 1;
    }
    // 2. 如果金额变负数，或者所有硬币都尝试过，则无解
    if (amt < 0) {
        return 0;
    }

    int res = 0;
    // 3. `for` 循环遍历所有「当前及之后的硬币」
    for (int i = start; i < coins.size(); i++) {
        // 递归：继续用 `coins[i]` 或者跳到 `coins[i+1]`
        res += coinChangeIIDFS(coins, i, amt - coins[i]);
    }

    return res;
}

/* 零钱兑换 II：记忆化搜索 */
int coinChangeIIDFSMem(vector<int> &coins, int start, int amt, vector<vector<int>> &memo) {
    // 1. 如果正好凑出金额 0，找到一种组合
    if (amt == 0) {
        return 1;
    }
    // 2. 如果金额变负数，或者硬币索引越界，则无解
    if (amt < 0) {
        return 0;
    }
    // 3. 若该状态已计算过，直接返回
    if (memo[start][amt] != -1) {
        return memo[start][amt];
    }

    int res = 0;
    // 4. 遍历所有硬币，从 `start` 开始，保证顺序性（避免重复组合）
    for (int i = start; i < coins.size(); i++) {
        res += coinChangeIIDFSMem(coins, i, amt - coins[i], memo);
    }

    // 5. 记忆化存储
    memo[start][amt] = res;
    return res;
}

/* 零钱兑换 II：动态规划 */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // 初始化 dp 表
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 初始化首列
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* 零钱兑换 II：空间优化后的动态规划 */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // 初始化 dp 表
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案之和
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver code */
int main(){
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // 暴力搜索
    int res = coinChangeIIDFS(coins, 0, amt);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    // 记忆化搜索
    vector<vector<int>> memo(coins.size(), vector<int>(amt + 1, -1));
    res = coinChangeIIDFSMem(coins, 0, amt, memo);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    // 动态规划
    res = coinChangeIIDP(coins, amt);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    // 空间优化后的动态规划
    res = coinChangeIIDPComp(coins, amt);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    return 0;
}
