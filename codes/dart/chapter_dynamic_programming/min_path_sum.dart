/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最小路径和：暴力搜索 */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // 若为左上角单元格，则终止搜索
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 若行列索引越界，则返回 +∞ 代价
  if (i < 0 || j < 0) {
    // 在 Dart 中，int 类型是固定范围的整数，不存在表示“无穷大”的值
    return BigInt.from(2).pow(31).toInt();
  }
  // 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // 返回从左上角到 (i, j) 的最小路径代价
  return min(left, up) + grid[i][j];
}

/* 最小路径和：记忆化搜索 */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // 若为左上角单元格，则终止搜索
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 若行列索引越界，则返回 +∞ 代价
  if (i < 0 || j < 0) {
    // 在 Dart 中，int 类型是固定范围的整数，不存在表示“无穷大”的值
    return BigInt.from(2).pow(31).toInt();
  }
  // 若已有记录，则直接返回
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // 左边和上边单元格的最小路径代价
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // 记录并返回左上角到 (i, j) 的最小路径代价
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* 最小路径和：动态规划 */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // 状态转移：首行
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // 状态转移：首列
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // 状态转移：其余行和列
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* 最小路径和：空间优化后的动态规划 */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // 初始化 dp 表
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // 状态转移：其余行
  for (int i = 1; i < n; i++) {
    // 状态转移：首列
    dp[0] = dp[0] + grid[i][0];
    // 状态转移：其余列
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

// 暴力搜索
  int res = minPathSumDFS(grid, n - 1, m - 1);
  print("从左上角到右下角的做小路径和为 $res");

// 记忆化搜索
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("从左上角到右下角的做小路径和为 $res");

// 动态规划
  res = minPathSumDP(grid);
  print("从左上角到右下角的做小路径和为 $res");

// 空间优化后的动态规划
  res = minPathSumDPComp(grid);
  print("从左上角到右下角的做小路径和为 $res");
}
