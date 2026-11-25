/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* Minimum path sum with brute-force search */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // Stop searching at the top-left cell
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Return a cost of +∞ if either index is out of bounds
  if (i < 0 || j < 0) {
    // Dart's int type has a fixed range and no value representing infinity
    return BigInt.from(2).pow(31).toInt();
  }
  // Find the minimum path costs from the top left to (i-1, j) and (i, j-1)
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // Return the minimum path cost from the top left to (i, j)
  return min(left, up) + grid[i][j];
}

/* Minimum path sum with memoized search */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // Stop searching at the top-left cell
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // Return a cost of +∞ if either index is out of bounds
  if (i < 0 || j < 0) {
    // Dart's int type has a fixed range and no value representing infinity
    return BigInt.from(2).pow(31).toInt();
  }
  // Return the cached result if available
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // Minimum path costs for the cells to the left and above
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // Cache and return the minimum path cost from the top left to (i, j)
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* Minimum path sum with dynamic programming */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Initialize the dp table
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // State transitions for the first row
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // State transitions for the first column
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // State transitions for the remaining rows and columns
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* Minimum path sum with space-optimized dynamic programming */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // Initialize the dp table
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // State transitions for the remaining rows
  for (int i = 1; i < n; i++) {
    // State transitions for the first column
    dp[0] = dp[0] + grid[i][0];
    // State transitions for the remaining columns
    for (int j = 1; j < m; j++) {
      dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
    }
  }
  return dp[m - 1];
}

/* Driver code */
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
  print("Minimum path sum from the top left to the bottom right: $res");

// Memoized search
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("Minimum path sum from the top left to the bottom right: $res");

// Dynamic programming
  res = minPathSumDP(grid);
  print("Minimum path sum from the top left to the bottom right: $res");

// Space-optimized dynamic programming
  res = minPathSumDPComp(grid);
  print("Minimum path sum from the top left to the bottom right: $res");
}
