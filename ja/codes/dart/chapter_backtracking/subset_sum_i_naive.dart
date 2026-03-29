/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング：部分和 I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // 部分集合の和が target に等しければ、解を記録
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を走査
  for (int i = 0; i < choices.length; i++) {
    // 枝刈り：部分和が target を超える場合はその選択をスキップする
    if (total + choices[i] > target) {
      continue;
    }
    // 試行：選択を行い、要素と total を更新する
    state.add(choices[i]);
    // 次の選択へ進む
    backtrack(state, target, total + choices[i], choices, res);
    // バックトラック：選択を取り消し、前の状態に戻す
    state.removeLast();
  }
}

/* 部分和 I を解く（重複部分集合を含む） */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // 状態（部分集合）
  int total = 0; // 要素の合計
  List<List<int>> res = []; // 結果リスト（部分集合のリスト）
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("入力配列 nums = $nums, target = $target");
  print("和が $target に等しいすべての部分集合 res = $res");
  print("この方法が出力する結果には重複する集合が含まれることに注意してください");
}
