/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最小路徑和：暴力搜尋 */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // 若已到達左上角的格子，就結束搜尋
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 若列或欄的索引超出範圍，就回傳成本 +∞
  if (i < 0 || j < 0) {
    // 在 Dart 中，int 型別的整數範圍固定，沒有代表「無窮大」的值
    return BigInt.from(2).pow(31).toInt();
  }
  // 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑成本
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // 回傳從左上角到 (i, j) 的最小路徑成本
  return min(left, up) + grid[i][j];
}

/* 最小路徑和：記憶化搜尋 */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // 若已到達左上角的格子，就結束搜尋
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 若列或欄的索引超出範圍，就回傳成本 +∞
  if (i < 0 || j < 0) {
    // 在 Dart 中，int 型別的整數範圍固定，沒有代表「無窮大」的值
    return BigInt.from(2).pow(31).toInt();
  }
  // 若已有紀錄，直接回傳該值
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // 左方與上方格子的最小路徑成本
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // 記錄並回傳從左上角到 (i, j) 的最小路徑成本
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* 最小路徑和：動態規劃 */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // 狀態轉移：第一列
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // 狀態轉移：第一欄
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // 狀態轉移：其餘各列與各欄
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* 最小路徑和：空間最佳化後的動態規劃 */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // 初始化 dp 表
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // 狀態轉移：其餘各列
  for (int i = 1; i < n; i++) {
    // 狀態轉移：第一欄
    dp[0] = dp[0] + grid[i][0];
    // 狀態轉移：其餘各欄
    for (int j = 1; j < m; j++) {
      dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
    }
  }
  return dp[m - 1];
}

/* 主程式 */
void main() {
  List<List<int>> grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
  ];
  int n = grid.length, m = grid[0].length;

// 暴力搜尋
  int res = minPathSumDFS(grid, n - 1, m - 1);
  print("從左上角到右下角的最小路徑和為 $res");

// 記憶化搜尋
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("從左上角到右下角的最小路徑和為 $res");

// 動態規劃
  res = minPathSumDP(grid);
  print("從左上角到右下角的最小路徑和為 $res");

// 空間最佳化後的動態規劃
  res = minPathSumDPComp(grid);
  print("從左上角到右下角的最小路徑和為 $res");
}
