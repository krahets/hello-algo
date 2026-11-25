/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 백트래킹: 부분집합의 합 II */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 부분집합의 합이 target과 같으면 해를 기록한다
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // 모든 선택지를 순회한다
  // 가지치기 2: start부터 순회하여 같은 부분집합이 중복 생성되는 것을 막는다
  // 가지치기 3: start부터 순회하여 같은 원소를 다시 선택하지 않는다
  for (int i = start; i < choices.length; i++) {
    // 가지치기 1: 부분집합의 합이 target을 초과하면 즉시 반복을 끝낸다
    // 배열이 정렬되어 뒤의 원소가 더 크므로 부분집합의 합이 반드시 target을 초과한다
    if (target - choices[i] < 0) {
      break;
    }
    // 가지치기 4: 왼쪽 원소와 값이 같으면 중복된 탐색 분기이므로 건너뛴다
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // 시도: 원소를 선택하고 target과 start를 갱신한다
    state.add(choices[i]);
    // 다음 선택을 진행한다
    backtrack(state, target - choices[i], choices, i + 1, res);
    // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
    state.removeLast();
  }
}

/* 부분집합의 합 II 풀기 */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // 상태(부분집합)
  nums.sort(); // nums를 정렬한다
  int start = 0; // 순회 시작점
  List<List<int>> res = []; // 결과 리스트(부분집합의 리스트)
  backtrack(state, target, nums, start, res);
  return res;
}

/* 실행 코드 */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("입력 배열 nums = $nums, target = $target");
  print("목표 합 = $target | 조건을 만족하는 모든 부분집합 res = $res");
}
