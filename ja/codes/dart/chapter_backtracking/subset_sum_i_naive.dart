/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキングによる部分和問題 I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // 部分集合の要素の和が target に等しくなったら解を記録する
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を調べる
  for (int i = 0; i < choices.length; i++) {
    // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
    if (total + choices[i] > target) {
      continue;
    }
    // 試行：選択して要素の和 total を更新する
    state.add(choices[i]);
    // 次の選択に進む
    backtrack(state, target, total + choices[i], choices, res);
    // 後戻り：選択を取り消し、元の状態に戻す
    state.removeLast();
  }
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // 状態（部分集合）
  int total = 0; // 要素の和
  List<List<int>> res = []; // 結果のリスト（部分集合のリスト）
  backtrack(state, target, total, nums, res);
  return res;
}

/* 実行例 */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("入力配列 nums = $nums, target = $target");
  print("要素の和が $target となるすべての部分集合 res = $res");
  print("この方法の出力には重複する集合が含まれる点に注意");
}
