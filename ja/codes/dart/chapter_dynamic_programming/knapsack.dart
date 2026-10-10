/**
 * File: knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 0-1 ナップサック：総当たり探索 */
int knapsackDFS(List<int> wgt, List<int> val, int i, int c) {
  // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
  if (i == 0 || c == 0) {
    return 0;
  }
  // ナップサック容量を超える場合は、入れない選択しかできない
  if (wgt[i - 1] > c) {
    return knapsackDFS(wgt, val, i - 1, c);
  }
  // 品物 i を入れない場合と入れる場合の最大価値を計算する
  int no = knapsackDFS(wgt, val, i - 1, c);
  int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 2つの案のうち価値が大きいほうを返す
  return max(no, yes);
}

/* 0-1 ナップサック：メモ化探索 */
int knapsackDFSMem(
  List<int> wgt,
  List<int> val,
  List<List<int>> mem,
  int i,
  int c,
) {
  // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
  if (i == 0 || c == 0) {
    return 0;
  }
  // 既に記録があればそのまま返す
  if (mem[i][c] != -1) {
    return mem[i][c];
  }
  // ナップサック容量を超える場合は、入れない選択しかできない
  if (wgt[i - 1] > c) {
    return knapsackDFSMem(wgt, val, mem, i - 1, c);
  }
  // 品物 i を入れない場合と入れる場合の最大価値を計算する
  int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
  int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
  // 2 つの案のうち価値が大きい方を記録して返す
  mem[i][c] = max(no, yes);
  return mem[i][c];
}

/* 0-1 ナップサック：動的計画法 */
int knapsackDP(List<int> wgt, List<int> val, int cap) {
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
        dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
int knapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp テーブルを初期化
  List<int> dp = List.filled(cap + 1, 0);
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    // 逆順に走査する
    for (int c = cap; c >= 1; c--) {
      if (wgt[i - 1] <= c) {
        // 品物 i を選ばない場合と選ぶ場合の大きい方
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

  // 全探索
  int res = knapsackDFS(wgt, val, n, cap);
  print("ナップサック容量を超えない最大価値は $res");

  // メモ化探索
  List<List<int>> mem =
      List.generate(n + 1, (index) => List.filled(cap + 1, -1));
  res = knapsackDFSMem(wgt, val, mem, n, cap);
  print("ナップサック容量を超えない最大価値は $res");

  // 動的計画法
  res = knapsackDP(wgt, val, cap);
  print("ナップサック容量を超えない最大価値は $res");

  // 空間最適化後の動的計画法
  res = knapsackDPComp(wgt, val, cap);
  print("ナップサック容量を超えない最大価値は $res");
}
