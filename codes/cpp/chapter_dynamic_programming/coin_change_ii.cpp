/**
 * File: coin_change_ii.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 零钱兑换 II：二维动态规划（求硬币组合总数） */
int coinChangeIIDP(vector<int>& coins, int amount) {
    int n = coins.size();
    // dp[i][a] 表示前 i 种硬币，凑成金额 a 的组合总数
    vector<vector<int>> dp(n + 1, vector<int>(amount + 1, 0));

    // 初始化：金额为 0 时，只有 1 种组合方案（不选任何硬币）
    for (int i = 0; i <= n; ++i) {
        dp[i][0] = 1;
    }

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int a = 1; a <= amount; ++a) {
            if (coins[i - 1] > a) {
                // 硬币面额超过当前金额，无法选用，继承上一行结果
                dp[i][a] = dp[i - 1][a];
            } else {
                // 组合数 = 不选当前硬币 + 选当前硬币
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }

    return dp[n][amount];
}

/* 零钱兑换 II：一维空间优化 DP */
int coinChangeIIDPComp(vector<int>& coins, int amount) {
    // dp[a] 表示凑成金额 a 的组合总数
    vector<int> dp(amount + 1, 0);
    dp[0] = 1; // 初始条件

    // 遍历每种硬币
    for (int coin : coins) {
        // 正序遍历金额（完全背包特性）
        for (int a = coin; a <= amount; ++a) {
            dp[a] += dp[a - coin];
        }
    }

    return dp[amount];
}

/* 主函数测试 */
int main() {
    vector<int> coins = {1, 2, 5};
    int amount = 5;

    int res = coinChangeIIDP(coins, amount);
    cout << "[二维DP] 凑成目标金额的硬币组合数量为：" << res << endl;

    res = coinChangeIIDPComp(coins, amount);
    cout << "[一维优化DP] 凑成目标金额的硬币组合数量为：" << res << endl;

    return 0;
}
