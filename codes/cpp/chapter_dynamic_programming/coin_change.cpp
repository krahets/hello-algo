/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 零钱兑换：暴力搜索 */
int coinChangeDFS(vector<int> &coins, int amt, int maxVal) {
    // 若恰好凑出金额
    if (amt == 0) {
        return 0;
    }
    // 若金额越过 0 变为负数，说明不可行
    if (amt < 0) {
        // 返回一个很大的值表示无效
        return maxVal;
    }
    int res = maxVal;
    // 尝试拿每一种硬币
    for (int c : coins) {
        int sub = coinChangeDFS(coins, amt - c, maxVal);
        // 若子问题可行，再加上 1 枚当前硬币
        if (sub != maxVal) {
          res = min(res, 1 + sub);
        }
    }
    return res != maxVal ? res : -1;
}

/* 零钱兑换：记忆化搜索 */
int coinChangeDFSMem(vector<int> &coins, int amt, vector<int> &memo, int maxVal) {
    // 若恰好凑出金额
    if (amt == 0) {
        return 0;
    }
    // 若已不合法
    if (amt < 0) {
      return maxVal; // 用 INT_MAX 表示无法凑出
    }
    // 若已经计算过
    if (memo[amt] != -1) {
        return memo[amt];
    }

    int res = maxVal;
    for (int c : coins) {
        int sub = coinChangeDFSMem(coins, amt - c, memo, maxVal);
        if (sub != maxVal) {
          res = min(res, 1 + sub);
        }
    }
    memo[amt] = res;
    return res != maxVal ? res : -1;
}

/* 零钱兑换：动态规划 */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // 初始化 dp 表
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // 状态转移：首行首列
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 状态转移：其余行和列
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[i][a] = dp[i - 1][a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 零钱兑换：空间优化后的动态规划 */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // 初始化 dp 表
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // 状态转移
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 若超过目标金额，则不选硬币 i
                dp[a] = dp[a];
            } else {
                // 不选和选硬币 i 这两种方案的较小值
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;
    int maxVal = amt + 1;
    // 暴力搜索
    int res = coinChangeDFS(coins, amt, maxVal);
    cout << "凑到目标金额所需的最少硬币数量为 " << res << endl;
    // 记忆化搜索
    vector<int> memo(amt + 1, -1);
    res = coinChangeDFSMem(coins, amt, memo, maxVal);
    cout << "凑到目标金额所需的最少硬币数量为 " << res << endl;
    // 动态规划
    res = coinChangeDP(coins, amt);
    cout << "凑到目标金额所需的最少硬币数量为 " << res << endl;

    // 空间优化后的动态规划
    res = coinChangeDPComp(coins, amt);
    cout << "凑到目标金额所需的最少硬币数量为 " << res << endl;

    return 0;
}
