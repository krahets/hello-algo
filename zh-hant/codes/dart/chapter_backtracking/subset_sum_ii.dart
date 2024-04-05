/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯演算法：子集和 II */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 子集和等於 target 時，記錄解
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // 走訪所有選擇
  // 剪枝二：從 start 開始走訪，避免生成重複子集
  // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
  for (int i = start; i < choices.length; i++) {
    // 剪枝一：若子集和超過 target ，則直接結束迴圈
    // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
    if (target - choices[i] < 0) {
      break;
    }
    // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // 嘗試：做出選擇，更新 target, start
    state.add(choices[i]);
    // 進行下一輪選擇
    backtrack(state, target - choices[i], choices, i + 1, res);
    // 回退：撤銷選擇，恢復到之前的狀態
    state.removeLast();
  }
}

/* 求解子集和 II */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // 狀態（子集）
  nums.sort(); // 對 nums 進行排序
  int start = 0; // 走訪起始點
  List<List<int>> res = []; // 結果串列（子集串列）
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("輸入陣列 nums = $nums, target = $target");
  print("所有和等於 $target 的子集 res = $res");
}
