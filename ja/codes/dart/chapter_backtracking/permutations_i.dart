/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング：順列 I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // 状態の長さが要素数に等しければ、解を記録
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を走査
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 枝刈り：要素の重複選択を許可しない
    if (!selected[i]) {
      // 試行: 選択を行い、状態を更新
      selected[i] = true;
      state.add(choice);
      // 次の選択へ進む
      backtrack(state, choices, selected, res);
      // バックトラック：選択を取り消し、前の状態に戻す
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* 全順列 I */
List<List<int>> permutationsI(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("入力配列 nums = $nums");
  print("すべての順列 res = $res");
}
