/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 完全背包：動態規劃 */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 若重量超過背包容量，就不選物品 i
        dp[i][c] = dp[i - 1][c];
      } else {
        // 取不選與選取物品 i 兩種情況中的較大值
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 完全背包：空間最佳化後的動態規劃 */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // 初始化 dp 表
  List<int> dp = List.filled(cap + 1, 0);
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 若重量超過背包容量，就不選物品 i
        dp[c] = dp[c];
      } else {
        // 取不選與選取物品 i 兩種情況中的較大值
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* 主程式 */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // 動態規劃
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("在背包容量限制內，物品的最大總價值為 $res");

  // 空間最佳化後的動態規劃
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("在背包容量限制內，物品的最大總價值為 $resComp");
}
