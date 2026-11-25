/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキングによる全順列 I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // 状態の長さが要素数に達したら解を記録する
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を調べる
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 枝刈り：同じ要素は二度選ばない
    if (!selected[i]) {
      // 試行：選択して状態を更新する
      selected[i] = true;
      state.add(choice);
      // 次の選択に進む
      backtrack(state, choices, selected, res);
      // 後戻り：選択を取り消し、元の状態に戻す
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

/* 実行例 */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("入力配列 nums = $nums");
  print("すべての順列 res = $res");
}
