/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 完全ナップサック問題：動的計画法 */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // ナップサック容量を超えるなら品物 i は選ばない
        dp[i][c] = dp[i - 1][c];
      } else {
        // 品物 i を選ばない場合と選ぶ場合の大きい方
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 完全ナップサック問題：空間最適化後の動的計画法 */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化
  List<int> dp = List.filled(cap + 1, 0);
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // ナップサック容量を超えるなら品物 i は選ばない
        dp[c] = dp[c];
      } else {
        // 品物 i を選ばない場合と選ぶ場合の大きい方
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

  // 動的計画法
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("ナップサック容量を超えない最大価値は $res");

  // 空間最適化後の動的計画法
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("ナップサック容量を超えない最大価値は $resComp");
}
