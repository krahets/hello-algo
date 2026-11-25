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
  // Record a solution when the subset sums to target
  if (total == target) {
    res.add(List.from(state));
    return;
  }
  // Try each choice
  for (int i = 0; i < choices.length; i++) {
    // Prune: skip choices that would take the subset sum over target
    if (total + choices[i] > target) {
      continue;
    }
    // Make a choice and update the running sum total
    state.add(choices[i]);
    // Make the next choice
    backtrack(state, target, total + choices[i], choices, res);
    // Backtrack: undo the choice to restore the previous state
    state.removeLast();
  }
}

/* Solve subset sum I (including duplicate subsets) */
List<List<int>> subsetSumINaive(List<int> nums, int target) {
  List<int> state = []; // State (current subset)
  int total = 0; // Sum of elements
  List<List<int>> res = []; // Results (list of subsets)
  backtrack(state, target, total, nums, res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumINaive(nums, target);

  print("Input array nums = $nums, target = $target");
  print("Subsets that sum to $target: res = $res");
  print("This method returns duplicate subsets");
}
