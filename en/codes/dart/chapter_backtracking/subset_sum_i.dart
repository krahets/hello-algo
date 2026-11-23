/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking: subset sum I */
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
  for (int i = start; i < choices.length; i++) {
    // Pruning 1: exit the loop if this choice exceeds the remaining target
    // The array is sorted, so later elements are at least as large and also exceed the remaining target
    if (target - choices[i] < 0) {
      break;
    }
    // Try: make a choice and update target and start
    state.add(choices[i]);
    // Proceed to the next choice
    backtrack(state, target - choices[i], choices, i, res);
    // Backtrack: undo the choice and restore the previous state
    state.removeLast();
  }
}

/* Solve subset sum I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  nums.sort(); // Sort nums
  int start = 0; // Starting index for iteration
  List<List<int>> res = []; // Result list (list of subsets)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum $target: res = $res");
}
