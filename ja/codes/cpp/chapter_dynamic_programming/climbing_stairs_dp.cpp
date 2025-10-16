/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 階段登り：動的プログラミング */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // DPテーブルを初期化し、部分問題の解を格納するために使用
    vector<int> dp(n + 1);
    // 初期状態：最小の部分問題の解を事前設定
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さな問題から大きな部分問題を段階的に解く
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 階段登り：空間最適化動的プログラミング */
int climbingStairsDPComp(int n) {
    if (n == 1 || n == 2)
        return n;
    int a = 1, b = 2;
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* ドライバーコード */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    res = climbingStairsDPComp(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    return 0;
}