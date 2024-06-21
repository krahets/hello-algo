/**
 * File: unbounded_knapsack.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Complete knapsack: Dynamic programming */
int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Initialize dp table
    vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The greater value between not choosing and choosing item i
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* Complete knapsack: Space-optimized dynamic programming */
int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
    int n = wgt.size();
    // Initialize dp table
    vector<int> dp(cap + 1, 0);
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeding the knapsack capacity, do not choose item i
                dp[c] = dp[c];
            } else {
                // The greater value between not choosing and choosing item i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver code */
int main() {
    vector<int> wgt = {1, 2, 3};
    vector<int> val = {5, 11, 15};
    int cap = 4;

    // Dynamic programming
    int res = unboundedKnapsackDP(wgt, val, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    // Space-optimized dynamic programming
    res = unboundedKnapsackDPComp(wgt, val, cap);
    cout << "The maximum value within the bag capacity is " << res << endl;

    return 0;
}
