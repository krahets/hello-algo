/**
 * File: climbing_stairs_dfs.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Search */
int dfs(int i) {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 || i == 2)
        return i;
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1) + dfs(i - 2);
    return count;
}

/* Climbing stairs: search */
int climbingStairsDFS(int n) {
    return dfs(n);
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsDFS(n);
    cout << "Climbing " << n << " stairs: " << res << " ways" << endl;

    return 0;
}
