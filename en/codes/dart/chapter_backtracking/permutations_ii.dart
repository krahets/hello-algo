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
  // Record a solution when the state contains all the elements
  if (state.length == choices.length) {
    res.add(List.from(state));
    return;
  }
  // Try each choice
  Set<int> duplicated = {};
  for (int i = 0; i < choices.length; i++) {
    int choice = choices[i];
    // Skip elements already in use and values already tried at this level
    if (!selected[i] && !duplicated.contains(choice)) {
      // Make a choice and update the state
      duplicated.add(choice); // Track values already tried
      selected[i] = true;
      state.add(choice);
      // Make the next choice
      backtrack(state, choices, selected, res);
      // Backtrack: undo the choice to restore the previous state
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
