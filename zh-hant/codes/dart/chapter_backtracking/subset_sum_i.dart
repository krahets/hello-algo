/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯演算法：子集和 I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // 子集總和達到目標時，記錄此解
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // 逐一檢查所有選項
  // 剪枝二：從 start 開始走訪，避免產生重複子集
  for (int i = start; i < choices.length; i++) {
    // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
    // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
    if (target - choices[i] < 0) {
      break;
    }
    // 嘗試：做出選擇，更新 target 和 start
    state.add(choices[i]);
    // 進入下一輪選擇
    backtrack(state, target - choices[i], choices, i, res);
    // 回溯：撤銷選擇，還原先前的狀態
    state.removeLast();
  }
}

/* 求解子集和 I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // 狀態（子集）
  nums.sort(); // 將 nums 排序
  int start = 0; // 走訪的起點
  List<List<int>> res = []; // 結果串列（子集串列）
  backtrack(state, target, nums, start, res);
  return res;
}

/* 主程式 */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("輸入陣列 nums = $nums, target = $target");
  print("總和等於 $target 的所有子集 res = $res");
}
