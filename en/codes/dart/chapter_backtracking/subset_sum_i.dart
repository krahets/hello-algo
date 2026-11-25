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
  // Record a solution when the subset sums to target
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Try each choice
  // Pruning rule 2: start at start to avoid duplicate subsets
  for (int i = start; i < choices.length; i++) {
    // Pruning rule 1: break if the subset sum would exceed target
    // The array is sorted, so later elements are at least as large and would also take the sum over target
    if (target - choices[i] < 0) {
      break;
    }
    // Make a choice and update target and start
    state.add(choices[i]);
    // Make the next choice
    backtrack(state, target - choices[i], choices, i, res);
    // Backtrack: undo the choice to restore the previous state
    state.removeLast();
  }
}

/* Solve subset sum I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // State (current subset)
  nums.sort(); // Sort nums
  int start = 0; // Starting index
  List<List<int>> res = []; // Results (list of subsets)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Input array nums = $nums, target = $target");
  print("Subsets that sum to $target: res = $res");
}
