/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 回溯演算法：全排列 I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // 當狀態長度等於元素個數時，記錄此解
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // 逐一檢查所有選項
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 剪枝：不可重複選取同一個元素
    if (!selected[i]) {
      // 嘗試：做出選擇並更新狀態
      selected[i] = true;
      state.add(choice);
      // 進入下一輪選擇
      backtrack(state, choices, selected, res);
      // 回溯：撤銷選擇，還原先前的狀態
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* 全排列 I */
List<List<int>> permutationsI(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* 主程式 */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("輸入陣列 nums = $nums");
  print("所有排列 res = $res");
}
