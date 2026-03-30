/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* コイン両替 II：動的計画法 */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // dp テーブルを初期化
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 先頭列を初期化する
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 目標金額を超えるなら硬貨 i は選ばない
        dp[i][a] = dp[i - 1][a];
      } else {
        // コイン i を選ばない場合と選ぶ場合の和
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* コイン両替 II：空間最適化した動的計画法 */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // dp テーブルを初期化
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // 状態遷移
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 目標金額を超えるなら硬貨 i は選ばない
        dp[a] = dp[a];
      } else {
        // コイン i を選ばない場合と選ぶ場合の和
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

  // 動的計画法
  int res = coinChangeIIDP(coins, amt);
  print("目標金額を作る硬貨の組み合わせ数は $res");

  // 空間最適化後の動的計画法
  res = coinChangeIIDPComp(coins, amt);
  print("目標金額を作る硬貨の組み合わせ数は $res");
}
