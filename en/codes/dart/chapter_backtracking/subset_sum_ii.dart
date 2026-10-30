/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: subset sum II */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // Record a solution when the subset sum reaches the original target (the remaining target is 0)
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Iterate over all choices
  // Pruning 2: iterate from start to avoid generating duplicate subsets
  // Pruning 3: start after the previously chosen index to avoid choosing the same element again
  for (int i = start; i < choices.length; i++) {
    // Pruning 1: exit the loop if this choice exceeds the remaining target
    // The array is sorted, so later elements are at least as large and also exceed the remaining target
    if (target - choices[i] < 0) {
      break;
    }
    // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // Try: make a choice and update target and start
    state.add(choices[i]);
    // Proceed to the next choice
    backtrack(state, target - choices[i], choices, i + 1, res);
    // Backtrack: undo the choice and restore the previous state
    state.removeLast();
  }
}

/* Solve subset sum II */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  nums.sort(); // Sort nums
  int start = 0; // Starting index for iteration
  List<List<int>> res = []; // Result list (list of subsets)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum $target: res = $res");
}
