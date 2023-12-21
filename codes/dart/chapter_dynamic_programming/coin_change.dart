/**
 * File: coin_change.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 零钱兑换：动态规划 */
int coinChangeDP(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 状态转移：首行首列
  for (int a = 1; a <= amt; a++) {
    dp[0][a] = MAX;
  }
  // 状态转移：其余行和列
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超过目标金额，则不选硬币 i
        dp[i][a] = dp[i - 1][a];
      } else {
        // 不选和选硬币 i 这两种方案的较小值
        dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
      }
    }
  }
  return dp[n][amt] != MAX ? dp[n][amt] : -1;
}

/* 零钱兑换：空间优化后的动态规划 */
int coinChangeDPComp(List<int> coins, int amt) {
  int n = coins.length;
  int MAX = amt + 1;
  // 初始化 dp 表
  List<int> dp = List.filled(amt + 1, MAX);
  dp[0] = 0;
  // 状态转移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超过目标金额，则不选硬币 i
        dp[a] = dp[a];
      } else {
        // 不选和选硬币 i 这两种方案的较小值
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

  // 动态规划
  int res = coinChangeDP(coins, amt);
  print("凑到目标金额所需的最少硬币数量为 $res");

  // 空间优化后的动态规划
  res = coinChangeDPComp(coins, amt);
  print("凑到目标金额所需的最少硬币数量为 $res");
}
