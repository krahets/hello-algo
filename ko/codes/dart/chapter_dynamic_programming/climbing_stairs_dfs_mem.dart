/**
 * File: climbing_stairs_dfs_mem.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 메모이제이션 탐색 */
int dfs(int i, List<int> mem) {
  // 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
  if (i == 1 || i == 2) return i;
  // dp[i]의 기록이 있으면 바로 반환한다
  if (mem[i] != -1) return mem[i];
  // dp[i] = dp[i-1] + dp[i-2]
  int count = dfs(i - 1, mem) + dfs(i - 2, mem);
  // dp[i] 기록
  mem[i] = count;
  return count;
}

/* 계단 오르기: 메모이제이션 탐색 */
int climbingStairsDFSMem(int n) {
  // mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
  List<int> mem = List.filled(n + 1, -1);
  return dfs(n, mem);
}

/* 실행 예제 */
void main() {
  int n = 9;

  int res = climbingStairsDFSMem(n);
  print("계단 수: $n, 오르는 방법 수: $res");
}
