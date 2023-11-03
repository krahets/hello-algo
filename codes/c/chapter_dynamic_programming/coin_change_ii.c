/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 零钱兑换 II：动态规划 */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // 初始化 dp 表
    int dp[n + 1][amt + 1];
    memset(dp, 0, sizeof(dp));
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
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // 初始化 dp 表
    int dp[amt + 1];
    memset(dp, 0, sizeof(dp));
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
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 5;

    // 动态规划
    int res = coinChangeIIDP(coins, amt, coinsSize);
    printf("凑出目标金额的硬币组合数量为 %d\n", res);

    // 空间优化后的动态规划
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("凑出目标金额的硬币组合数量为 %d\n", res);

    return 0;
}
