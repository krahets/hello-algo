/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキングによる部分和問題 I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 部分集合の要素の和が target に等しくなったら解を記録する
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を調べる
  // 枝刈り 2：start から調べて部分集合の重複を防ぐ
  for (int i = start; i < choices.length; i++) {
    // 枝刈り 1：部分集合の要素の和が target を超えたらループを終了する
    // 配列はソート済みで、後の要素ほど大きく、和は必ず target を超えるため
    if (target - choices[i] < 0) {
      break;
    }
    // 試行：選択して target と start を更新する
    state.add(choices[i]);
    // 次の選択に進む
    backtrack(state, target - choices[i], choices, i, res);
    // 後戻り：選択を取り消し、元の状態に戻す
    state.removeLast();
  }
}

/* 部分和問題 I を解く */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // 状態（部分集合）
  nums.sort(); // nums をソートする
  int start = 0; // 走査の開始位置
  List<List<int>> res = []; // 結果のリスト（部分集合のリスト）
  backtrack(state, target, nums, start, res);
  return res;
}

/* 実行例 */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("入力配列 nums = $nums, target = $target");
  print("要素の和が $target となるすべての部分集合 res = $res");
}
