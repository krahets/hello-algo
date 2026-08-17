/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Permutations II */
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
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
    if (!selected[i] && !duplicated.contains(choice)) {
      // Attempt: make choice, update state
      duplicated.add(choice); // Record the selected element value
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

/* Permutations II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("Input array nums = $nums");
  print("All permutations res = $res");
}
