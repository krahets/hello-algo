/**
 * File: preorder_traversal_iii_template.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Check whether the current state is a solution */
bool isSolution(List<TreeNode> state) {
  return state.isNotEmpty && state.last.val == 7;
}

/* Record the solution */
void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
  res.add(List.from(state));
}

/* Check whether the choice is valid in the current state */
bool isValid(List<TreeNode> state, TreeNode? choice) {
  return choice != null && choice.val != 3;
}

/* Update the state */
void makeChoice(List<TreeNode> state, TreeNode? choice) {
  state.add(choice!);
}

/* Restore the state */
void undoChoice(List<TreeNode> state, TreeNode? choice) {
  state.removeLast();
}

/* Backtracking: example 3 */
void backtrack(
  List<TreeNode> state,
  List<TreeNode?> choices,
  List<List<TreeNode>> res,
) {
  // Check whether this is a solution
  if (isSolution(state)) {
    // Record the solution
    recordSolution(state, res);
  }
  // Iterate over all choices
  for (TreeNode? choice in choices) {
    // Prune: check whether the choice is valid
    if (isValid(state, choice)) {
      // Try: make a choice and update the state
      makeChoice(state, choice);
      // Proceed to the next choice
      backtrack(state, [choice!.left, choice.right], res);
      // Backtrack: undo the choice and restore the previous state
      undoChoice(state, choice);
    }
  }
}

/* Driver code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nInitialize the binary tree");
  printTree(root);

  // Backtracking algorithm
  List<List<TreeNode>> res = [];
  backtrack([], [root!], res);
  print("\nOutput all paths from the root to nodes with value 7, requiring that no node on the path has value 3");
  for (List<TreeNode> path in res) {
    print(List.from(path.map((e) => e.val)));
  }
}
