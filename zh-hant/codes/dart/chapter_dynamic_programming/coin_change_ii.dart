/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 零錢兌換 II：動態規劃 */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // 初始化 dp 表
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 初始化第一欄
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若面額超過目標金額，就不選硬幣 i
        dp[i][a] = dp[i - 1][a];
      } else {
        // 將不選與選取硬幣 i 兩種情況的組合數相加
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* 零錢兌換 II：空間最佳化後的動態規劃 */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // 初始化 dp 表
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // 狀態轉移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 若面額超過目標金額，就不選硬幣 i
        dp[a] = dp[a];
      } else {
        // 將不選與選取硬幣 i 兩種情況的組合數相加
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* 主程式 */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // 動態規劃
  int res = coinChangeIIDP(coins, amt);
  print("湊出目標金額的硬幣組合數為 $res");

  // 空間最佳化後的動態規劃
  res = coinChangeIIDPComp(coins, amt);
  print("湊出目標金額的硬幣組合數為 $res");
}
