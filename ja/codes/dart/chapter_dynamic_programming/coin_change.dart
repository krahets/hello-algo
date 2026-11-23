/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 硬貨の両替：動的計画法 */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // dp テーブルを初期化する
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 状態遷移：先頭行と先頭列
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // 状態遷移：残りの行と列
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 目標金額を超える場合、硬貨 i を選ばない
        dp[i][a] = dp[i - 1][a];
      } else {
        // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
        dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 硬貨の両替：空間を最適化した動的計画法 */
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // dp テーブルを初期化する
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 目標金額を超える場合、硬貨 i を選ばない
        dp[a] = dp[a];
      } else {
        // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
        dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[amt] != MAX ? dp[amt] : -1;
}

/* 実行用コード */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 4;

  // 動的計画法
  int res = coinChangeDP(coins, amt);
  print("目標金額にするために必要な硬貨の最小枚数は $res");

  // 空間を最適化した動的計画法
  res = coinChangeDPComp(coins, amt);
  print("目標金額にするために必要な硬貨の最小枚数は $res");
}
