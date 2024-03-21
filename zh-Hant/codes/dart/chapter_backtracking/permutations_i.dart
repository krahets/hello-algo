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
  // 當狀態長度等於元素數量時，記錄解
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // 走訪所有選擇
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // 剪枝：不允許重複選擇元素
    if (!selected[i]) {
      // 嘗試：做出選擇，更新狀態
      selected[i] = true;
      state.add(choice);
      // 進行下一輪選擇
      backtrack(state, choices, selected, res);
      // 回退：撤銷選擇，恢復到之前的狀態
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

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("輸入陣列 nums = $nums");
  print("所有排列 res = $res");
}
