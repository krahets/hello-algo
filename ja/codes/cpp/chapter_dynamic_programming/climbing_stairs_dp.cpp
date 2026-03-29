/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 階段登り：動的計画法 */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // 部分問題の解を保存するために dp テーブルを初期化
    vector<int> dp(n + 1);
    // 初期状態：最小部分問題の解をあらかじめ設定
    dp[1] = 1;
    dp[2] = 2;
    // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* 階段登り：空間最適化した動的計画法 */
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

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    cout << "階段を " << n << " 段上る方法は全部で " << res << " 通り" << endl;

    res = climbingStairsDPComp(n);
    cout << "階段を " << n << " 段上る方法は全部で " << res << " 通り" << endl;

    return 0;
}
