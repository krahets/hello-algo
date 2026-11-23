/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* バックトラッキング：部分集合和 I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 部分集合の和が target と等しくなったら、解を記録する
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // すべての選択肢を走査する
  // 枝刈り 2：start から走査を始め、重複した部分集合の生成を避ける
  for (int i = start; i < choices.length; i++) {
    // 枝刈り 1：部分集合の和が target を超えたら、直ちにループを終了する
    // 配列はソート済みで後ろの要素ほど大きいため、部分集合の和が必ず target を超えるからである
    if (target - choices[i] < 0) {
      break;
    }
    // 試行：選択を行い、target, start を更新する
    state.add(choices[i]);
    // 次の選択に進む
    backtrack(state, target - choices[i], choices, i, res);
    // 復元：選択を取り消し、以前の状態に戻す
    state.removeLast();
  }
}

/* 部分集合和 I を解く */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // 状態（部分集合）
  nums.sort(); // nums をソートする
  int start = 0; // 走査の開始位置
  List<List<int>> res = []; // 結果リスト（部分集合のリスト）
  backtrack(state, target, nums, start, res);
  return res;
}

/* 実行用コード */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("入力配列 nums = $nums, target = $target");
  print("和が $target になるすべての部分集合 res = $res");
}
