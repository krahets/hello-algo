/**
 * File: climbing_stairs_dp.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 계단 오르기: 동적 계획법 */
int climbingStairsDP(int n) {
  if (n == 1 || n == 2) return n;
  // 부분 문제의 해를 저장할 dp 테이블 초기화
  List<int> dp = List.filled(n + 1, 0);
  // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
  dp[1] = 1;
  dp[2] = 2;
  // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
  for (int i = 3; i <= n; i++) {
    dp[i] = dp[i - 1] + dp[i - 2];
  }
  return dp[n];
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
int climbingStairsDPComp(int n) {
  if (n == 1 || n == 2) return n;
  int a = 1, b = 2;
  for (int i = 3; i <= n; i++) {
    int tmp = b;
    b = a + b;
    a = tmp;
  }
  return b;
}

/* 실행 예제 */
void main() {
  int n = 9;

  int res = climbingStairsDP(n);
  print("계단 수: $n, 오르는 방법 수: $res");

  res = climbingStairsDPComp(n);
  print("계단 수: $n, 오르는 방법 수: $res");
}
