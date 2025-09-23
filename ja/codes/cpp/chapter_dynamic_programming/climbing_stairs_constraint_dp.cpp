/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 制約付き階段登り：動的プログラミング */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // DPテーブルを初期化し、部分問題の解を格納するために使用
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));
    // 初期状態：最小の部分問題の解を事前設定
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状態遷移：小さな問題から大きな部分問題を段階的に解く
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* ドライバーコード */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    return 0;
}