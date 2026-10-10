/**
 * File: min_path_sum.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 最小経路和：全探索 */
int minPathSumDFS(List<List<int>> grid, int i, int j) {
  // 左上のセルなら探索を終了する
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 行または列のインデックスが範囲外なら、コスト +∞ を返す
  if (i < 0 || j < 0) {
    // Dart では、int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
    return BigInt.from(2).pow(31).toInt();
  }
  // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
  int up = minPathSumDFS(grid, i - 1, j);
  int left = minPathSumDFS(grid, i, j - 1);
  // 左上隅から (i, j) までの最小経路コストを返す
  return min(left, up) + grid[i][j];
}

/* 最小経路和：メモ化探索 */
int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
  // 左上のセルなら探索を終了する
  if (i == 0 && j == 0) {
    return grid[0][0];
  }
  // 行または列のインデックスが範囲外なら、コスト +∞ を返す
  if (i < 0 || j < 0) {
    // Dart では、int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
    return BigInt.from(2).pow(31).toInt();
  }
  // 既に記録があればそのまま返す
  if (mem[i][j] != -1) {
    return mem[i][j];
  }
  // 左と上のセルからの最小経路コスト
  int up = minPathSumDFSMem(grid, mem, i - 1, j);
  int left = minPathSumDFSMem(grid, mem, i, j - 1);
  // 左上から (i, j) までの最小経路コストを記録して返す
  mem[i][j] = min(left, up) + grid[i][j];
  return mem[i][j];
}

/* 最小経路和：動的計画法 */
int minPathSumDP(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // dp テーブルを初期化
  List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
  dp[0][0] = grid[0][0];
  // 状態遷移：先頭行
  for (int j = 1; j < m; j++) {
    dp[0][j] = dp[0][j - 1] + grid[0][j];
  }
  // 状態遷移：先頭列
  for (int i = 1; i < n; i++) {
    dp[i][0] = dp[i - 1][0] + grid[i][0];
  }
  // 状態遷移: 残りの行と列
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < m; j++) {
      dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
    }
  }
  return dp[n - 1][m - 1];
}

/* 最小経路和：空間最適化後の動的計画法 */
int minPathSumDPComp(List<List<int>> grid) {
  int n = grid.length, m = grid[0].length;
  // dp テーブルを初期化
  List<int> dp = List.filled(m, 0);
  dp[0] = grid[0][0];
  for (int j = 1; j < m; j++) {
    dp[j] = dp[j - 1] + grid[0][j];
  }
  // 状態遷移：残りの行
  for (int i = 1; i < n; i++) {
    // 状態遷移：先頭列
    dp[0] = dp[0] + grid[i][0];
    // 状態遷移：残りの列
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

// 全探索
  int res = minPathSumDFS(grid, n - 1, m - 1);
  print("左上から右下までの最小経路和は $res");

// メモ化探索
  List<List<int>> mem = List.generate(n, (i) => List.filled(m, -1));
  res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
  print("左上から右下までの最小経路和は $res");

// 動的計画法
  res = minPathSumDP(grid);
  print("左上から右下までの最小経路和は $res");

// 空間最適化後の動的計画法
  res = minPathSumDPComp(grid);
  print("左上から右下までの最小経路和は $res");
}
