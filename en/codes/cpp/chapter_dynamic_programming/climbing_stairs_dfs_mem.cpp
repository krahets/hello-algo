/**
 * File: climbing_stairs_dfs_mem.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Memoized search */
int dfs(int i, vector<int> &mem) {
    // Known dp[1] and dp[2], return them
    if (i == 1 || i == 2)
        return i;
    // If there is a record for dp[i], return it
    if (mem[i] != -1)
        return mem[i];
    // dp[i] = dp[i-1] + dp[i-2]
    int count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // Record dp[i]
    mem[i] = count;
    return count;
}

/* Climbing stairs: Memoized search */
int climbingStairsDFSMem(int n) {
    // mem[i] records the total number of solutions for climbing to the ith step, -1 means no record
    vector<int> mem(n + 1, -1);
    return dfs(n, mem);
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsDFSMem(n);
    cout << "There are " << res << " solutions to climb " << n << " stairs" << endl;

    return 0;
}
