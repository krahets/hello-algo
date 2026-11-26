/**
 * File: climbing_stairs_backtrack.dart
 * Created Time: 2023-08-11
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 백트래킹 */
void backtrack(List<int> choices, int state, int n, List<int> res) {
  // n번째 계단에 도달하면 방법 수를 1 늘린다
  if (state == n) {
    res[0]++;
  }
  // 모든 선택지 순회
  for (int choice in choices) {
    // 가지치기: n번째 계단을 넘지 않는다
    if (state + choice > n) continue;
    // 시도: 선택한 뒤 상태를 갱신한다
    backtrack(choices, state + choice, n, res);
    // 선택 취소
  }
}

/* 계단 오르기: 백트래킹 */
int climbingStairsBacktrack(int n) {
  List<int> choices = [1, 2]; // 한 번에 한 계단 또는 두 계단을 오른다
  int state = 0; // 0번째 계단에서 출발한다
  List<int> res = [];
  res.add(0); // res[0]에 방법 수를 기록한다
  backtrack(choices, state, n, res);
  return res[0];
}

/* 실행 예제 */
void main() {
  int n = 9;

  int res = climbingStairsBacktrack(n);
  print("계단 수: $n, 오르는 방법 수: $res");
}
