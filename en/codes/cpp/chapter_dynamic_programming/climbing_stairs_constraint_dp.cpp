/**
 * File: climbing_stairs_constraint_dp.cpp
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Constrained climbing stairs: Dynamic programming */
int climbingStairsConstraintDP(int n) {
    if (n == 1 || n == 2) {
        return 1;
    }
    // Initialize dp table, used to store subproblem solutions
    vector<vector<int>> dp(n + 1, vector<int>(3, 0));
    // Initial state: preset the smallest subproblem solution
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transition: gradually solve larger subproblems from smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsConstraintDP(n);
    cout << "There are " << res << " solutions to climb " << n << " stairs" << endl;

    return 0;
}
