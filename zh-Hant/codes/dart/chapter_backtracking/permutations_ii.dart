/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯算法：全排列 II */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // 当状态长度等于元素数量时，记录解
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // 遍历所有选择
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
    if (!selected[i] && !duplicated.contains(choice)) {
      // 尝试：做出选择，更新状态
      duplicated.add(choice); // 记录选择过的元素值
      selected[i] = true;
      state.add(choice);
      // 进行下一轮选择
      backtrack(state, choices, selected, res);
      // 回退：撤销选择，恢复到之前的状态
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* 全排列 II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("输入数组 nums = $nums");
  print("所有排列 res = $res");
}
