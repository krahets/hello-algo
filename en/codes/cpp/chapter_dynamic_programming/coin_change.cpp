/**
 * File: coin_change.cpp
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Coin change: dynamic programming */
int coinChangeDP(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Initialize the dp table
    vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
    // State transitions: first row and first column
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // State transitions: remaining rows and columns
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[i][a] = dp[i - 1][a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Coin change: space-optimized dynamic programming */
int coinChangeDPComp(vector<int> &coins, int amt) {
    int n = coins.size();
    int MAX = amt + 1;
    // Initialize the dp table
    vector<int> dp(amt + 1, MAX);
    dp[0] = 0;
    // State transitions
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // If the coin exceeds the target amount, do not choose coin i
                dp[a] = dp[a];
            } else {
                // Take the smaller result of not choosing and choosing coin i
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver code */
int main() {
    vector<int> coins = {1, 2, 5};
    int amt = 4;

    // Dynamic programming
    int res = coinChangeDP(coins, amt);
    cout << "Minimum number of coins needed to reach the target amount: " << res << endl;

    // Space-optimized dynamic programming
    res = coinChangeDPComp(coins, amt);
    cout << "Minimum number of coins needed to reach the target amount: " << res << endl;

    return 0;
}
