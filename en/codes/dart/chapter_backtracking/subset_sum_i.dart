/**
 * File: subset_sum_i.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Subset Sum I */
void backtrack(
  List<int> state,
  int target,
  List<int> choices,
  int start,
  List<List<int>> res,
) {
  // When the subset sum equals target, record the solution
  if (target == 0) {
    res.add(List.from(state));
    return;
  }
  // Traverse all choices
  // Pruning two: start traversing from start to avoid generating duplicate subsets
  for (int i = start; i < choices.length; i++) {
    // Pruning one: if the subset sum exceeds target, end the loop immediately
    // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
    if (target - choices[i] < 0) {
      break;
    }
    // Attempt: make a choice, update target, start
    state.add(choices[i]);
    // Proceed to the next round of selection
    backtrack(state, target - choices[i], choices, i, res);
    // Retract: undo the choice, restore to the previous state
    state.removeLast();
  }
}

/* Solve Subset Sum I */
List<List<int>> subsetSumI(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  nums.sort(); // Sort nums
  int start = 0; // Start point for traversal
  List<List<int>> res = []; // Result list (subset list)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [3, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumI(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets equal to $target res = $res");
}
