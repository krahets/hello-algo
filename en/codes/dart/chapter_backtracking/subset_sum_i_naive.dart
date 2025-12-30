/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Subset sum I */
void backtrack(
  List<int> state,
  int target,
  int total,
  List<int> choices,
  List<List<int>> res,
) {
  // When the subset sum equals target, record the solution
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Traverse all choices
  for (int i = 0; i < choices.length; i++) {
    // Pruning: if the subset sum exceeds target, skip this choice
    if (total + choices[i] > target) {
      continue;
    }
    // Attempt: make choice, update element sum total
    state.add(choices[i]);
    // Proceed to the next round of selection
    backtrack(state, target, total + choices[i], choices, res);
    // Backtrack: undo choice, restore to previous state
    state.removeLast();
  }
}

/* Solve subset sum I (including duplicate subsets) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  int total = 0; // Sum of elements
  List<List<int>> res = []; // Result list (subset list)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum equal to $target res = $res");
  print("Please note that this method outputs results containing duplicate sets");
}
