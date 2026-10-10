/**
 * File: preorder_traversal_ii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Preorder traversal: Example 2 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null) {
    return;
  }

  // Attempt
  path.add(root);
  if (root.val == 7) {
    // Record solution
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // Backtrack
  path.removeLast();
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree");
  printTree(root);

  // Preorder traversal
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\nOutput all paths from root node to node 7");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
