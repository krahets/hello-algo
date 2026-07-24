/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 带约束爬楼梯：动态规划（不能连续爬 2 阶） */
int climbingStairsConstraintDP(int n) {
    // 边界条件
    if (n < 1) return 0;
    if (n == 1) return 1;
    if (n == 2) return 1;

    // dp[i][1] = 最后一步爬 1 阶
    // dp[i][2] = 最后一步爬 2 阶
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));

    // 初始状态
    dp[1][1] = 1;
    dp[1][2] = 0;

    dp[2][1] = 0;
    dp[2][2] = 1;

    // 状态转移
    for (int i = 3; i <= n; ++i) {
        dp[i][1] = dp[i-1][2];        // 最后 1 阶 ← 前一步必须是 2 阶
        dp[i][2] = dp[i-2][1] + dp[i-2][2];  // 最后 2 阶 ← 前两步任意
    }

    // 总方案 = 两种最后一步之和
    return dp[n][1] + dp[n][2];
}

/* 主函数测试 */
int main() {
    int n = 9;
    int res = climbingStairsConstraintDP(n);
    cout << "爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;
    return 0;
}
