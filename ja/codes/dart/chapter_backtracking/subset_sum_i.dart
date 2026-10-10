/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング：部分和 I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 部分集合の和が target に等しければ、解を記録
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を走査
  // 枝刈り 2: start から走査し、重複する部分集合の生成を避ける
  for (int i = start; i < choices.length; i++) {
    // 枝刈り1：部分集合の和が target を超えたら、直ちにループを終了する
    // 配列はソート済みで後続要素のほうが大きく、部分集合の和は必ず target を超えるため
    if (target - choices[i] < 0) {
      break;
    }
    // 試す：選択を行い、target と start を更新
    state.add(choices[i]);
    // 次の選択へ進む
    backtrack(state, target - choices[i], choices, i, res);
    // バックトラック：選択を取り消し、前の状態に戻す
    state.removeLast();
  }
}

/* 部分和 I を解く */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // 状態（部分集合）
  nums.sort(); // nums をソート
  int start = 0; // 開始点を走査
  List<List<int>> res = []; // 結果リスト（部分集合のリスト）
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("入力配列 nums = $nums, target = $target");
  print("和が $target に等しいすべての部分集合 res = $res");
}
