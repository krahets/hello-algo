/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 探索 */
int dfs(int i) {
    // 既知の値 dp[1] と dp[2] のうち、該当する方を返す
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* 階段の登り方：探索 */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* 実行例 */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "全 " << n << " 段の階段の登り方は " << res << " 通り" << endl;

    return 0;
}
