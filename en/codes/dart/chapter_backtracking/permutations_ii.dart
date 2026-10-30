/**
 * File: permutations_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: permutations II */
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
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Prune: do not reuse an element or choose the same value again at this depth
    if (!selected[i] && !duplicated.contains(choice)) {
      // Try: make a choice and update the state
      duplicated.add(choice); // Record the chosen value
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

/* Permutations II */
List<List<int>> permutationsII(List<int> nums) {
  List<List<int>> res = [];
  backtrack([], nums, List.filled(nums.length, false), res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [1, 2, 2];

  List<List<int>> res = permutationsII(nums);

  print("Input array nums = $nums");
  print("All permutations res = $res");
}
