/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: subset sum I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // Record a solution when the subset sum equals target
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Iterate over all choices
  for (int i = 0; i < choices.length; i++) {
    // Prune: skip this choice if the subset sum would exceed target
    if (total + choices[i] > target) {
      continue;
    }
    // Try: make a choice and update the sum total
    state.add(choices[i]);
    // Proceed to the next choice
    backtrack(state, target, total + choices[i], choices, res);
    // Backtrack: undo the choice and restore the previous state
    state.removeLast();
  }
}

/* Solve subset sum I (with duplicate subsets) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  int total = 0; // Sum of the elements
  List<List<int>> res = []; // Result list (list of subsets)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum $target: res = $res");
  print("Note that this method produces duplicate subsets");
}
