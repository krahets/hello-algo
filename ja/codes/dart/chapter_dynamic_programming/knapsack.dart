/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 0-1 ナップサック問題：全探索 */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // 全品物の選択を終えたか、空き容量がなければ、価値 0 を返す
  if (i == 0 || c == 0) {
    return 0;
  }
  // 容量を超える場合は、入れない選択しかできない
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // 品物 i を入れない場合と入れる場合の最大価値を求める
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 2 通りのうち価値が大きい方を返す
  return max(no, yes);
}

/* 0-1 ナップサック問題：メモ化探索 */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // 全品物の選択を終えたか、空き容量がなければ、価値 0 を返す
  if (i == 0 || c == 0) {
    return 0;
  }
  // 記録済みなら、その値を返す
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // 容量を超える場合は、入れない選択しかできない
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // 品物 i を入れない場合と入れる場合の最大価値を求める
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 2 通りのうち大きい方の価値を記録して返す
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* 0-1 ナップサック問題：動的計画法 */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
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
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 0-1 ナップサック問題：使用メモリを削減した動的計画法 */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化する
  List<int> dp = List.filled(cap + 1, 0);
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    // 逆順に走査する
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* 実行例 */
void main() {
  List<int> wgt = [10, 20, 30, 40, 50];
  List<int> val = [50, 120, 150, 210, 240];
  int cap = 50;
  int n = wgt.length;

  // 全探索
  int res = knapsackDFS(wgt, val, n, cap);
  print("容量内でナップサックに入る品物の最大価値は $res");

  // メモ化探索
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("容量内でナップサックに入る品物の最大価値は $res");

  // 動的計画法
  res = knapsackDP(wgt, val, cap);
  print("容量内でナップサックに入る品物の最大価値は $res");

  // 使用メモリを削減した動的計画法
  res = knapsackDPComp(wgt, val, cap);
  print("容量内でナップサックに入る品物の最大価値は $res");
}
