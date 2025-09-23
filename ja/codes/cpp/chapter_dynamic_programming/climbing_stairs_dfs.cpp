/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 探索 */
int dfs(int i) {
    // 既知の dp[1] と dp[2] を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 階段登り：探索 */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* ドライバーコード */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << n << "段の階段を登る解は" << res << "通りです" << endl;

    return 0;
}