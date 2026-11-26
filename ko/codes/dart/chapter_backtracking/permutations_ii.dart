/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 백트래킹: 순열 II */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // 상태의 길이가 원소 개수와 같으면 해를 기록한다
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // 모든 선택지를 순회한다
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 가지치기: 이미 선택한 원소를 다시 고르거나 같은 층에서 값이 같은 원소를 다시 고르지 않는다
    if (!selected[i] && !duplicated.contains(choice)) {
      // 시도: 하나를 선택하고 상태를 갱신한다
      duplicated.add(choice); // 선택한 원소의 값을 기록한다
      selected[i] = true;
      state.add(choice);
      // 다음 선택을 진행한다
      backtrack(state, choices, selected, res);
      // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* 순열 II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* 실행 코드 */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("입력 배열 nums = $nums");
  print("모든 순열 res = $res");
}
