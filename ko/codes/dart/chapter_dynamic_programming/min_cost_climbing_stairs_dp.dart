/**
 * File: min_cost_climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 계단 오르기의 최소 비용: 동적 계획법 */
int minCostClimbingStairsDP(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  // 부분 문제의 해를 저장할 dp 테이블 초기화
  List<int> dp = List.filled(n + 1, 0);
  // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
  dp[1] = cost[1];
  dp[2] = cost[2];
  // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
  for (int i = 3; i <= n; i++) {
    dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
  }
  return dp[n];
}

/* 계단 오르기의 최소 비용: 공간 최적화 동적 계획법 */
int minCostClimbingStairsDPComp(List<int> cost) {
  int n = cost.length - 1;
  if (n == 1 || n == 2) return cost[n];
  int a = cost[1], b = cost[2];
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = min(a, tmp) + cost[i];
    a = tmp;
  }
  return b;
}

/* 실행 예제 */
void main() {
  List<int> cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
  print("입력한 계단별 비용 목록: $cost");

  int res = minCostClimbingStairsDP(cost);
  print("계단을 모두 오르는 최소 비용: $res");

  res = minCostClimbingStairsDPComp(cost);
  print("계단을 모두 오르는 최소 비용: $res");
}
