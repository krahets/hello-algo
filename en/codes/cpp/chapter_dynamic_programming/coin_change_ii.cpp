/**
 * File: coin_change_ii.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change II: dynamic programming */
int coinChangeIIDP(vector<int> &coins, int amt) {
    int n = coins.size();
    // Initialize the dp table
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // Initialize the first column
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // State transitions
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Add the numbers of ways without and with coin i
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    return dp[n][amt];
}

/* Coin change II: space-optimized dynamic programming */
int coinChangeIIDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    // Initialize the dp table
    vector<int> dp(amt + 1, 0);
    dp[0] = 1;
    // State transitions
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Add the numbers of ways without and with coin i
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
    cout << "Number of coin combinations that make the target amount: " << res << endl;

    // Space-optimized dynamic programming
    res = coinChangeIIDPComp(coins, amt);
    cout << "Number of coin combinations that make the target amount: " << res << endl;

    return 0;
}
