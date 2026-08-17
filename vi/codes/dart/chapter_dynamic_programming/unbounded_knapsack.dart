/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Unbounded knapsack: Dynamic programming */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Initialize dp table
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // If exceeds knapsack capacity, don't select item i
        dp[i][c] = dp[i - 1][c];
      } else {
        // The larger value between not selecting and selecting item i
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* Unbounded knapsack: Space-optimized dynamic programming */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Initialize dp table
  List<int> dp = List.filled(cap + 1, 0);
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // If exceeds knapsack capacity, don't select item i
        dp[c] = dp[c];
      } else {
        // The larger value between not selecting and selecting item i
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Driver Code */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // Dynamic programming
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");

  // Space-optimized dynamic programming
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("Maximum item value not exceeding knapsack capacity is $resComp");
}
