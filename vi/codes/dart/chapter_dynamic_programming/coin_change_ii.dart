/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Coin change II: Dynamic programming */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // Initialize dp table
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // Initialize first column
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If exceeds target amount, don't select coin i
        dp[i][a] = dp[i - 1][a];
      } else {
        // Sum of the two options: not selecting and selecting coin i
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* Coin change II: Space-optimized dynamic programming */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // Initialize dp table
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // If exceeds target amount, don't select coin i
        dp[a] = dp[a];
      } else {
        // Sum of the two options: not selecting and selecting coin i
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // Dynamic programming
  int res = coinChangeIIDP(coins, amt);
  print("Number of coin combinations to make target amount is $res");

  // Space-optimized dynamic programming
  res = coinChangeIIDPComp(coins, amt);
  print("Number of coin combinations to make target amount is $res");
}
