/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 0-1 knapsack: Brute-force search */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // If all items have been selected or knapsack has no remaining capacity, return value 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // If exceeds knapsack capacity, can only choose not to put it in
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // Calculate the maximum value of not putting in and putting in item i
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Return the larger value of the two options
  return max(no, yes);
}

/* 0-1 knapsack: Memoization search */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // If all items have been selected or knapsack has no remaining capacity, return value 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // If there's a record, return it directly
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // If exceeds knapsack capacity, can only choose not to put it in
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // Calculate the maximum value of not putting in and putting in item i
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Record and return the larger value of the two options
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* 0-1 knapsack: Dynamic programming */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
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
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 0-1 knapsack: Space-optimized dynamic programming */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Initialize dp table
  List<int> dp = List.filled(cap + 1, 0);
  // State transition
  for (int i = 1; i <= n; i++) {
    // Traverse in reverse order
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // The larger value between not selecting and selecting item i
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Driver Code */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;
  int n = wgt.length;

  // Brute-force search
  int res = knapsackDFS(wgt, val, n, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");

  // Memoization search
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");

  // Dynamic programming
  res = knapsackDP(wgt, val, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");

  // Space-optimized dynamic programming
  res = knapsackDPComp(wgt, val, cap);
  print("Maximum item value not exceeding knapsack capacity is $res");
}
