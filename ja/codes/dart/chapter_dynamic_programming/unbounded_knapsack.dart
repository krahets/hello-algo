/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 個数制限なしナップサック問題：動的計画法 */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化する
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 容量を超える場合は品物 i を選ばない
        dp[i][c] = dp[i - 1][c];
      } else {
        // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 個数制限なしナップサック問題：使用メモリを削減した動的計画法 */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化する
  List<int> dp = List.filled(cap + 1, 0);
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 容量を超える場合は品物 i を選ばない
        dp[c] = dp[c];
      } else {
        // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* 実行例 */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // 動的計画法
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("容量内でナップサックに入る品物の最大価値は $res");

  // 使用メモリを削減した動的計画法
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("容量内でナップサックに入る品物の最大価値は $resComp");
}
