/**
 * File: permutations_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: permutations I */
void backtrack(
  List<int> state,
  List<int> choices,
  List<bool> selected,
  List<List<int>> res,
) {
  // Record a solution when the state length equals the number of elements
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Iterate over all choices
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Prune: do not choose an element more than once
    if (!selected[i]) {
      // Try: make a choice and update the state
      selected[i] = true;
      state.add(choice);
      // Proceed to the next choice
      backtrack(state, choices, selected, res);
      // Backtrack: undo the choice and restore the previous state
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

/* Driver code */
void main() {
  List<int> nums = [1, 2, 3];

  List<List<int>> res = permutationsI(nums);

  print("Input array nums = $nums");
  print("All permutations res = $res");
}
