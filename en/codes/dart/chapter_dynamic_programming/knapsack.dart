/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 0-1 knapsack with brute-force search */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // Return a value of 0 if all items have been considered or no capacity remains
  if (i == 0 || c == 0) {
    return 0;
  }
  // If the item exceeds the remaining capacity, we can only skip it
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // Compute the maximum values for skipping and taking item i
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Return the larger of the two values
  return max(no, yes);
}

/* 0-1 knapsack with memoized search */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // Return a value of 0 if all items have been considered or no capacity remains
  if (i == 0 || c == 0) {
    return 0;
  }
  // Return the cached result if available
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // If the item exceeds the remaining capacity, we can only skip it
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // Compute the maximum values for skipping and taking item i
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // Cache and return the larger of the two values
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* 0-1 knapsack with dynamic programming */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Initialize the dp table
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // State transition
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // Skip item i if its weight exceeds the capacity
        dp[i][c] = dp[i - 1][c];
      } else {
        // Take the larger value from skipping or taking item i
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 0-1 knapsack with space-optimized dynamic programming */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // Initialize the dp table
  List<int> dp = List.filled(cap + 1, 0);
  // State transition
  for (int i = 1; i <= n; i++) {
    // Iterate in descending order
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // Take the larger value from skipping or taking item i
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* Driver code */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;
  int n = wgt.length;

  // Brute-force search
  int res = knapsackDFS(wgt, val, n, cap);
  print("Maximum total item value within the weight limit: $res");

  // Memoized search
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("Maximum total item value within the weight limit: $res");

  // Dynamic programming
  res = knapsackDP(wgt, val, cap);
  print("Maximum total item value within the weight limit: $res");

  // Space-optimized dynamic programming
  res = knapsackDPComp(wgt, val, cap);
  print("Maximum total item value within the weight limit: $res");
}
