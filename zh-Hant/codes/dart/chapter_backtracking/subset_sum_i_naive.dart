/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯算法：子集和 I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // 子集和等于 target 时，记录解
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // 遍历所有选择
  for (int i = 0; i < choices.length; i++) {
    // 剪枝：若子集和超过 target ，则跳过该选择
    if (total + choices[i] > target) {
      continue;
    }
    // 尝试：做出选择，更新元素和 total
    state.add(choices[i]);
    // 进行下一轮选择
    backtrack(state, target, total + choices[i], choices, res);
    // 回退：撤销选择，恢复到之前的状态
    state.removeLast();
  }
}

/* 求解子集和 I（包含重复子集） */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // 状态（子集）
  int total = 0; // 元素和
  List<List<int>> res = []; // 结果列表（子集列表）
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("输入数组 nums = $nums, target = $target");
  print("所有和等于 $target 的子集 res = $res");
  print("请注意，该方法输出的结果包含重复集合");
}
