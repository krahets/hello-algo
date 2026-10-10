/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Coin change: Dynamic programming */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Initialize dp table
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // State transition: first row and first column
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // State transition: rest of the rows and columns
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If exceeds target amount, don't select coin i
        dp[i][a] = dp[i - 1][a];
      } else {
        // The smaller value between not selecting and selecting coin i
        dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* Coin change: Space-optimized dynamic programming */
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // Initialize dp table
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If exceeds target amount, don't select coin i
        dp[a] = dp[a];
      } else {
        // The smaller value between not selecting and selecting coin i
        dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 4;

  // Dynamic programming
  int res = coinChangeDP(coins, amt);
  print("Minimum coins needed to make target amount is $res");

  // Space-optimized dynamic programming
  res = coinChangeDPComp(coins, amt);
  print("Minimum coins needed to make target amount is $res");
}
