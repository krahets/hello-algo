/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯演算法：子集和 I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // 子集和等於 target 時，記錄解
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // 走訪所有選擇
  for (int i = 0; i < choices.length; i++) {
    // 剪枝：若子集和超過 target ，則跳過該選擇
    if (total + choices[i] > target) {
      continue;
    }
    // 嘗試：做出選擇，更新元素和 total
    state.add(choices[i]);
    // 進行下一輪選擇
    backtrack(state, target, total + choices[i], choices, res);
    // 回退：撤銷選擇，恢復到之前的狀態
    state.removeLast();
  }
}

/* 求解子集和 I（包含重複子集） */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // 狀態（子集）
  int total = 0; // 元素和
  List<List<int>> res = []; // 結果串列（子集串列）
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("輸入陣列 nums = $nums, target = $target");
  print("所有和等於 $target 的子集 res = $res");
  print("請注意，該方法輸出的結果包含重複集合");
}
