/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 零钱兑换 II：动态规划 */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 初始化首列
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // 状态转移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超过目标金额，则不选硬币 i
        dp[i][a] = dp[i - 1][a];
      } else {
        // 不选和选硬币 i 这两种方案之和
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* 零钱兑换 II：空间优化后的动态规划 */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // 初始化 dp 表
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // 状态转移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若超过目标金额，则不选硬币 i
        dp[a] = dp[a];
      } else {
        // 不选和选硬币 i 这两种方案之和
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* Driver Code */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // 动态规划
  int res = coinChangeIIDP(coins, amt);
  print("凑出目标金额的硬币组合数量为 $res");

  // 空间优化后的动态规划
  res = coinChangeIIDPComp(coins, amt);
  print("凑出目标金额的硬币组合数量为 $res");
}
