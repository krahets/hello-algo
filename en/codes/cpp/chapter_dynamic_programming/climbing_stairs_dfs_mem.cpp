/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Memoized search */
int dfs(int i, vector<int> &mem) {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 || i == 2)
        return i;
    // If dp[i] has been recorded, return it directly
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
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
