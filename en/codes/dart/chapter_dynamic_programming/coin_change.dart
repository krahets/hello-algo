/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Coin change: dynamic programming */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Initialize the dp table
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // State transitions: first row and first column
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // State transitions: remaining rows and columns
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If the coin exceeds the current amount a, do not choose coin i
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
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Initialize the dp table
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // State transitions
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If the coin exceeds the current amount a, do not choose coin i
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
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 4;

  // Dynamic programming
  int res = coinChangeDP(coins, amt);
  print("Minimum number of coins needed to reach the target amount: $res");

  // Space-optimized dynamic programming
  res = coinChangeDPComp(coins, amt);
  print("Minimum number of coins needed to reach the target amount: $res");
}
