/**
 * File: climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Climbing stairs: Dynamic programming */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // Initialize dp table, used to store subproblem solutions
    vector<int> dp(n + 1);
    // Initial state: preset the smallest subproblem solution
    dp[1] = 1;
    dp[2] = 2;
    // State transition: gradually solve larger subproblems from smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Climbing stairs: Space-optimized dynamic programming */
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
    cout << "There are " << res << " solutions to climb " << n << " stairs" << endl;

    res = climbingStairsDPComp(n);
    cout << "There are " << res << " solutions to climb " << n << " stairs" << endl;

    return 0;
}
