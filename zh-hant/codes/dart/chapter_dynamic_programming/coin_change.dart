/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 零錢兌換：動態規劃 */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 狀態轉移：首行首列
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // 狀態轉移：其餘行和列
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超過目標金額，則不選硬幣 i
        dp[i][a] = dp[i - 1][a];
      } else {
        // 不選和選硬幣 i 這兩種方案的較小值
        dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 零錢兌換：空間最佳化後的動態規劃 */
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // 初始化 dp 表
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超過目標金額，則不選硬幣 i
        dp[a] = dp[a];
      } else {
        // 不選和選硬幣 i 這兩種方案的較小值
        dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[amt] != MAX ? dp[amt] : -1;
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 4;

  // 動態規劃
  int res = coinChangeDP(coins, amt);
  print("湊到目標金額所需的最少硬幣數量為 $res");

  // 空間最佳化後的動態規劃
  res = coinChangeDPComp(coins, amt);
  print("湊到目標金額所需的最少硬幣數量為 $res");
}
