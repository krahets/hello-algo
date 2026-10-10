/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Permutations I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // When the state length equals the number of elements, record the solution
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Traverse all choices
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Pruning: do not allow repeated selection of elements
    if (!selected[i]) {
      // Attempt: make choice, update state
      selected[i] = true;
      state.add(choice);
      // Proceed to the next round of selection
      backtrack(state, choices, selected, res);
      // Backtrack: undo choice, restore to previous state
      selected[i] = false;
      state.removeLast();
    }
  }
}

/* Permutations I */
List<List<int>> permutationsI(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("Input array nums = $nums");
  print("All permutations res = $res");
}
