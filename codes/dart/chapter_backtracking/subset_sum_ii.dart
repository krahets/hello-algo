/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯算法：子集和 II */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 子集和等于 target 时，记录解
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // 遍历所有选择
  // 剪枝二：从 start 开始遍历，避免生成重复子集
  // 剪枝三：从 start 开始遍历，避免重复选择同一元素
  for (int i = start; i < choices.length; i++) {
    // 剪枝一：若子集和超过 target ，则直接结束循环
    // 这是因为数组已排序，后边元素更大，子集和一定超过 target
    if (target - choices[i] < 0) {
      break;
    }
    // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // 尝试：做出选择，更新 target, start
    state.add(choices[i]);
    // 进行下一轮选择
    backtrack(state, target - choices[i], choices, i + 1, res);
    // 回退：撤销选择，恢复到之前的状态
    state.removeLast();
  }
}

/* 求解子集和 II */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // 状态（子集）
  nums.sort(); // 对 nums 进行排序
  int start = 0; // 遍历起始点
  List<List<int>> res = []; // 结果列表（子集列表）
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("输入数组 nums = $nums, target = $target");
  print("所有和等于 $target 的子集 res = $res");
}
