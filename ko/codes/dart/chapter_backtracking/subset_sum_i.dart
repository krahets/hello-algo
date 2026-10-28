/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 백트래킹 알고리즘: 부분 집합 합 I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 부분 집합의 합이 target과 같으면 해를 기록한다
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // 모든 선택지를 순회한다
  // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
  for (int i = start; i < choices.length; i++) {
    // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
    // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
    if (target - choices[i] < 0) {
      break;
    }
    // 시도: 선택하고 target, start를 갱신한다
    state.add(choices[i]);
    // 다음 선택을 진행한다
    backtrack(state, target - choices[i], choices, i, res);
    // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
    state.removeLast();
  }
}

/* 부분 집합 합 I 풀기 */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // 상태(부분 집합)
  nums.sort(); // nums를 정렬한다
  int start = 0; // 순회 시작 위치
  List<List<int>> res = []; // 결과 리스트(부분 집합 리스트)
  backtrack(state, target, nums, start, res);
  return res;
}

/* 실행 코드 */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("입력 배열 nums = $nums, target = $target");
  print("합이 목표값($target)과 같은 모든 부분 집합 res = $res");
}
