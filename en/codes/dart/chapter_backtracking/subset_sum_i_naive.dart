/**
 * File: subset_sum_i_naive.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Subset Sum I */
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
    // Pruning: if the subset sum exceeds target, skip that choice
    if (total + choices[i] > target) {
      continue;
    }
    // Attempt: make a choice, update elements and total
    state.add(choices[i]);
    // Proceed to the next round of selection
    backtrack(state, target, total + choices[i], choices, res);
    // Retract: undo the choice, restore to the previous state
    state.removeLast();
  }
}

/* Solve Subset Sum I (including duplicate subsets) */
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
  print("All subsets equal to $target res = $res");
  print("Please note that the result of this method includes duplicate sets");
}
