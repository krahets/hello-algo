/**
 * File: edit_distance.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';

/* 편집 거리: 완전 탐색 */
int editDistanceDFS(String s, String t, int i, int j) {
  // s와 t가 모두 비어 있으면 0을 반환한다
  if (i == 0 && j == 0) return 0;
  // s가 비어 있으면 t의 길이를 반환한다
  if (i == 0) return j;
  // t가 비어 있으면 s의 길이를 반환한다
  if (j == 0) return i;
  // 두 문자가 같으면 둘 다 건너뛴다
  if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1);
  // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
  int insert = editDistanceDFS(s, t, i, j - 1);
  int delete = editDistanceDFS(s, t, i - 1, j);
  int replace = editDistanceDFS(s, t, i - 1, j - 1);
  // 최소 편집 횟수 반환
  return min(min(insert, delete), replace) + 1;
}

/* 편집 거리: 메모이제이션 탐색 */
int editDistanceDFSMem(String s, String t, List<List<int>> mem, int i, int j) {
  // s와 t가 모두 비어 있으면 0을 반환한다
  if (i == 0 && j == 0) return 0;
  // s가 비어 있으면 t의 길이를 반환한다
  if (i == 0) return j;
  // t가 비어 있으면 s의 길이를 반환한다
  if (j == 0) return i;
  // 기록이 있으면 바로 반환한다
  if (mem[i][j] != -1) return mem[i][j];
  // 두 문자가 같으면 둘 다 건너뛴다
  if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
  int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
  int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
  int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
  // 최소 편집 횟수를 기록하고 반환한다
  mem[i][j] = min(min(insert, delete), replace) + 1;
  return mem[i][j];
}

/* 편집 거리: 동적 계획법 */
int editDistanceDP(String s, String t) {
  int n = s.length, m = t.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(m + 1, 0));
  // 상태 전이: 첫 행과 첫 열
  for (int i = 1; i <= n; i++) {
    dp[i][0] = i;
  }
  for (int j = 1; j <= m; j++) {
    dp[0][j] = j;
  }
  // 상태 전이: 나머지 행과 열
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= m; j++) {
      if (s[i - 1] == t[j - 1]) {
        // 두 문자가 같으면 둘 다 건너뛴다
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
        dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
      }
    }
  }
  return dp[n][m];
}

/* 편집 거리: 공간 최적화 동적 계획법 */
int editDistanceDPComp(String s, String t) {
  int n = s.length, m = t.length;
  List<int> dp = List.filled(m + 1, 0);
  // 상태 전이: 첫 행
  for (int j = 1; j <= m; j++) {
    dp[j] = j;
  }
  // 상태 전이: 나머지 행
  for (int i = 1; i <= n; i++) {
    // 상태 전이: 첫 열
    int leftup = dp[0]; // dp[i-1, j-1] 임시 저장
    dp[0] = i;
    // 상태 전이: 나머지 열
    for (int j = 1; j <= m; j++) {
      int temp = dp[j];
      if (s[i - 1] == t[j - 1]) {
        // 두 문자가 같으면 둘 다 건너뛴다
        dp[j] = leftup;
      } else {
        // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
        dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1;
      }
      leftup = temp; // 다음 반복에서 쓸 dp[i-1, j-1] 값으로 갱신한다
    }
  }
  return dp[m];
}

/* 실행 예제 */
void main() {
  String s = "bag";
  String t = "pack";
  int n = s.length, m = t.length;

  // 완전 탐색
  int res = editDistanceDFS(s, t, n, m);
  print("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: $res");

  // 메모이제이션 탐색
  List<List<int>> mem = List.generate(n + 1, (_) => List.filled(m + 1, -1));
  res = editDistanceDFSMem(s, t, mem, n, m);
  print("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: $res");

  // 동적 계획법
  res = editDistanceDP(s, t);
  print("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: $res");

  // 공간 최적화 동적 계획법
  res = editDistanceDPComp(s, t);
  print("시작 문자열: " + s + " → 목표 문자열: " + t + " 최소 편집 횟수: $res");
}
