/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Minimum path sum: Brute-force search */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // If it's the top-left cell, terminate the search
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // If row or column index is out of bounds, return +∞ cost
  if (i < 0 || j < 0) {
    // In Dart, int type is fixed-range integer, no value representing "infinity"
    return BigInt.from(2).pow(31).toInt();
  }
  // Calculate the minimum path cost from top-left to (i-1, j) and (i, j-1)
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // Return the minimum path cost from top-left to (i, j)
  return min(left, up) + grid[i][j];
}

/* Minimum path sum: Memoization search */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // If it's the top-left cell, terminate the search
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // If row or column index is out of bounds, return +∞ cost
  if (i < 0 || j < 0) {
    // In Dart, int type is fixed-range integer, no value representing "infinity"
    return BigInt.from(2).pow(31).toInt();
  }
  // If there's a record, return it directly
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // Minimum path cost for left and upper cells
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // Record and return the minimum path cost from top-left to (i, j)
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* Minimum path sum: Dynamic programming */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Initialize dp table
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // State transition: first row
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // State transition: first column
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // State transition: rest of the rows and columns
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* Minimum path sum: Space-optimized dynamic programming */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Initialize dp table
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // State transition: rest of the rows
  for (int i = 1; i < n; i++) {
    // State transition: first column
    dp[0] = dp[0] + grid[i][0];
    // State transition: rest of the columns
    for (int j = 1; j < m; j++) {
      dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
    }
  }
  return dp[m - 1];
}

/* Driver Code */
void main() {
  List<List<int>> grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
  ];
  int n = grid.length, m = grid[0].length;

// Brute-force search
  int res = minPathSumDFS(grid, n - 1, m - 1);
  print("Minimum path sum from top-left to bottom-right is $res");

// Memoization search
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("Minimum path sum from top-left to bottom-right is $res");

// Dynamic programming
  res = minPathSumDP(grid);
  print("Minimum path sum from top-left to bottom-right is $res");

// Space-optimized dynamic programming
  res = minPathSumDPComp(grid);
  print("Minimum path sum from top-left to bottom-right is $res");
}
