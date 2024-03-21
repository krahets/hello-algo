/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 0-1 背包：暴力搜尋 */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // 若已選完所有物品或背包無剩餘容量，則返回價值 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // 若超過背包容量，則只能選擇不放入背包
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // 計算不放入和放入物品 i 的最大價值
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 返回兩種方案中價值更大的那一個
  return max(no, yes);
}

/* 0-1 背包：記憶化搜尋 */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // 若已選完所有物品或背包無剩餘容量，則返回價值 0
  if (i == 0 || c == 0) {
    return 0;
  }
  // 若已有記錄，則直接返回
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // 若超過背包容量，則只能選擇不放入背包
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // 計算不放入和放入物品 i 的最大價值
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 記錄並返回兩種方案中價值更大的那一個
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* 0-1 背包：動態規劃 */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 若超過背包容量，則不選物品 i
        dp[i][c] = dp[i - 1][c];
      } else {
        // 不選和選物品 i 這兩種方案的較大值
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 0-1 背包：空間最佳化後的動態規劃 */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // 初始化 dp 表
  List<int> dp = List.filled(cap + 1, 0);
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    // 倒序走訪
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // 不選和選物品 i 這兩種方案的較大值
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

  // 暴力搜尋
  int res = knapsackDFS(wgt, val, n, cap);
  print("不超過背包容量的最大物品價值為 $res");

  // 記憶化搜尋
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("不超過背包容量的最大物品價值為 $res");

  // 動態規劃
  res = knapsackDP(wgt, val, cap);
  print("不超過背包容量的最大物品價值為 $res");

  // 空間最佳化後的動態規劃
  res = knapsackDPComp(wgt, val, cap);
  print("不超過背包容量的最大物品價值為 $res");
}
