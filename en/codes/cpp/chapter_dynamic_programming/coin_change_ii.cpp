/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change II: Dynamic programming */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // Initialize dp table
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Initialize first column
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeding the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // The sum of the two options of not choosing and choosing coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Coin change II: Space-optimized dynamic programming */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // Initialize dp table
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // State transition
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If exceeding the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // The sum of the two options of not choosing and choosing coin i
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    return dp[amt];
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 5;

    // Dynamic programming
    int res = coinChangeIIDP(coins, amt);
    cout << "The number of coin combinations to make up the target amount is " << res << endl;

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt);
    cout << "The number of coin combinations to make up the target amount is " << res << endl;

    return 0;
}
