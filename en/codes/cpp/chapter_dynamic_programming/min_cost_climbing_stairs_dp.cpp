/**
 * File: min_cost_climbing_stairs_dp.cpp
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Minimum cost climbing stairs: Dynamic programming */
int minCostClimbingStairsDP(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // Initialize dp table, used to store solutions to subproblems
    vector<int> dp(n + 1);
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = cost[1];
    dp[2] = cost[2];
    // State transition: gradually solve larger subproblems from smaller ones
    for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Minimum cost climbing stairs: Space-optimized dynamic programming */
int minCostClimbingStairsDPComp(vector<int> &cost) {
    int n = cost.size() - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver Code */
int main() {
    vector<int> cost = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    cout << "Input stair cost list is ";
    printVector(cost);

    int res = minCostClimbingStairsDP(cost);
    cout << "Minimum cost to climb stairs is " << res << endl;

    res = minCostClimbingStairsDPComp(cost);
    cout << "Minimum cost to climb stairs is " << res << endl;

    return 0;
}
