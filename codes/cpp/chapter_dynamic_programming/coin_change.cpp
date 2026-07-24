/**
 * File: coin_change.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved by: Coding Tutor
 */

#include <iostream>
#include <vector>
#include <algorithm> // min()
using namespace std;

/* 零钱兑换：二维动态规划 */
int coinChangeDP(vector<int>& coins, int amount) {
    int n = coins.size();
    int max_val = amount + 1;

    // dp[i][a] = 前 i 种硬币，凑成金额 a 所需的最少硬币数
    vector<vector<int>> dp(n + 1, vector<int>(amount + 1, 0));

    // 初始化：没有硬币时，除了金额 0 都无法凑成
    for (int a = 1; a <= amount; ++a) {
        dp[0][a] = max_val;
    }

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int a = 1; a <= amount; ++a) {
            if (coins[i - 1] > a) {
                // 硬币太大，无法选，继承上一行结果
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选 vs 选（取更小值）
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }

    // 无法凑成返回 -1
    return dp[n][amount] != max_val ? dp[n][amount] : -1;
}

/* 零钱兑换：空间优化 DP（一维数组 O(amount)）*/
int coinChangeDPComp(vector<int>& coins, int amount) {
    int n = coins.size();
    int max_val = amount + 1;

    // dp[a] = 凑成金额 a 所需最少硬币数
    vector<int> dp(amount + 1, max_val);
    dp[0] = 0;

    // 状态转移
    for (int i = 1; i <= n; ++i) {
        for (int a = 1; a <= amount; ++a) {
            if (coins[i - 1] <= a) {
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }

    return dp[amount] != max_val ? dp[amount] : -1;
}

/* 主函数测试 */
int main() {
    vector<int> coins = {1, 2, 5};
    int amount = 4;

    int res = coinChangeDP(coins, amount);
    cout << "[二维DP] 最少硬币数：" << res << endl;

    res = coinChangeDPComp(coins, amount);
    cout << "[一维优化DP] 最少硬币数：" << res << endl;

    return 0;
}
