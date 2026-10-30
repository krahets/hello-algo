/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Climbing stairs with constraints: dynamic programming */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // Initialize the dp table to store subproblem solutions
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));
    // Initial states: set the solutions to the smallest subproblems
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transitions: solve progressively larger subproblems using smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Driver code */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    cout << "Climbing " << n << " stairs: " << res << " ways" << endl;

    return 0;
}
