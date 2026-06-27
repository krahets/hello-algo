/**
 * File: subset_sum_ii.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Backtracking algorithm: Subset sum II */
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
  // Pruning 2: start traversing from start to avoid generating duplicate subsets
  // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
  for (int i = start; i < choices.length; i++) {
    // Pruning 1: if the subset sum exceeds target, end the loop directly
    // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
    if (target - choices[i] < 0) {
      break;
    }
    // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
    if (i > start && choices[i] == choices[i - 1]) {
      continue;
    }
    // Attempt: make choice, update target, start
    state.add(choices[i]);
    // Proceed to the next round of selection
    backtrack(state, target - choices[i], choices, i + 1, res);
    // Backtrack: undo choice, restore to previous state
    state.removeLast();
  }
}

/* Solve subset sum II */
List<List<int>> subsetSumII(List<int> nums, int target) {
  List<int> state = []; // State (subset)
  nums.sort(); // Sort nums
  int start = 0; // Start point for traversal
  List<List<int>> res = []; // Result list (subset list)
  backtrack(state, target, nums, start, res);
  return res;
}

/* Driver Code */
void main() {
  List<int> nums = [4, 4, 5];
  int target = 9;

  List<List<int>> res = subsetSumII(nums, target);

  print("Input array nums = $nums, target = $target");
  print("All subsets with sum equal to $target res = $res");
}
