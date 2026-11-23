/**
 * File: coin_change_ii.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 동전 교환 II: 동적 계획법 */
int coinChangeIIDP(List<int> coins, int amt) {
  int n = coins.length;
  // dp 테이블을 초기화한다
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(amt + 1, 0));
  // 첫 번째 열을 초기화한다
  for (int i = 0; i <= n; i++) {
    dp[i][0] = 1;
  }
  // 상태 전이
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[i][a] = dp[i - 1][a];
      } else {
        // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
      }
    }
  }
  return dp[n][amt];
}

/* 동전 교환 II: 공간을 최적화한 동적 계획법 */
int coinChangeIIDPComp(List<int> coins, int amt) {
  int n = coins.length;
  // dp 테이블을 초기화한다
  List<int> dp = List.filled(amt + 1, 0);
  dp[0] = 1;
  // 상태 전이
  for (int i = 1; i <= n; i++) {
    for (int a = 1; a <= amt; a++) {
      if (coins[i - 1] > a) {
        // 목표 금액을 초과하면 동전 i를 선택하지 않는다
        dp[a] = dp[a];
      } else {
        // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
        dp[a] = dp[a] + dp[a - coins[i - 1]];
      }
    }
  }
  return dp[amt];
}

/* 실행 코드 */
void main() {
  List<int> coins = [1, 2, 5];
  int amt = 5;

  // 동적 계획법
  int res = coinChangeIIDP(coins, amt);
  print("목표 금액을 만드는 동전 조합의 수 = $res");

  // 공간을 최적화한 동적 계획법
  res = coinChangeIIDPComp(coins, amt);
  print("목표 금액을 만드는 동전 조합의 수 = $res");
}
