/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // 动态规划
    int res = coinChangeIIDP(coins, amt);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    // 空间优化后的动态规划
    res = coinChangeIIDPComp(coins, amt);
    cout << "凑出目标金额的硬币组合数量为 " << res << endl;

    return 0;
}
