/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 制約付きの階段の上り方：動的計画法 */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // 部分問題の解を格納する dp テーブルを初期化する
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));
    // 初期状態：最小の部分問題の解を設定する
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 状態遷移：小さな部分問題から順に大きな部分問題を解く
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* 実行用コード */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    cout << "上る段数： " << n << " 段、上り方は全部で " << res << " 通り" << endl;

    return 0;
}
