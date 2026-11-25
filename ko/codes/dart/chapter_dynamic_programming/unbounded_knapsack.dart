/**
 * File: unbounded_knapsack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 무한 배낭: 동적 계획법 */
int unboundedKnapsackDP(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp 테이블 초기화
  List<List<int>> dp = List.generate(n + 1, (index) => List.filled(cap + 1, 0));
  // 상태 전이
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
        dp[i][c] = dp[i - 1][c];
      } else {
        // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
        dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[n][cap];
}

/* 무한 배낭: 공간 최적화 동적 계획법 */
int unboundedKnapsackDPComp(List<int> wgt, List<int> val, int cap) {
  int n = wgt.length;
  // dp 테이블 초기화
  List<int> dp = List.filled(cap + 1, 0);
  // 상태 전이
  for (int i = 1; i <= n; i++) {
    for (int c = 1; c <= cap; c++) {
      if (wgt[i - 1] > c) {
        // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
        dp[c] = dp[c];
      } else {
        // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
        dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
      }
    }
  }
  return dp[cap];
}

/* 실행 예제 */
void main() {
  List<int> wgt = [1, 2, 3];
  List<int> val = [5, 11, 15];
  int cap = 4;

  // 동적 계획법
  int res = unboundedKnapsackDP(wgt, val, cap);
  print("배낭 용량 내에서 얻는 최대 가치: $res");

  // 공간 최적화 동적 계획법
  int resComp = unboundedKnapsackDPComp(wgt, val, cap);
  print("배낭 용량 내에서 얻는 최대 가치: $resComp");
}
