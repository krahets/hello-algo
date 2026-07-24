/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
using namespace std;

/* 爬楼梯：动态规划 */
int climbingStairsDP(int n) {
    // 边界处理
    if (n <= 0) return 0;
    if (n == 1 || n == 2) return n;

    // 初始化 dp 表，存储子问题解
    vector<int> dp(n + 1);
    dp[1] = 1;
    dp[2] = 2;

    // 状态转移
    for (int i = 3; i <= n; ++i) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }

    return dp[n];
}

/* 爬楼梯：空间优化后的动态规划（O(1) 空间） */
int climbingStairsDPComp(int n) {
    // 边界处理
    if (n <= 0) return 0;
    if (n == 1 || n == 2) return n;

    int a = 1, b = 2;
    for (int i = 3; i <= n; ++i) {
        int temp = b;
        b = a + b;
        a = temp;
    }

    return b;
}

/* 主函数测试 */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "[动态规划] 爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;

    res = climbingStairsDPComp(n);
    cout << "[空间优化DP] 爬 " << n << " 阶楼梯共有 " << res << " 种方案" << endl;

    return 0;
}
