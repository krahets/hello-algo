/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Memoized search */
int dfs(int i, vector<int> &mem) {
    // Return the known value for dp[1] or dp[2]
    if (i == 1 || i == 2)
        return i;
    // Return dp[i] directly if it is cached
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Cache dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs with memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "Climbing " << n << " stairs: " << res << " ways" << endl;

    return 0;
}
