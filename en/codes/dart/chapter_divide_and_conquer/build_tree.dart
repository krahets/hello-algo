/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Build binary tree: Divide and conquer */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // Terminate when subtree interval is empty
  if (r - l < 0) {
    return null;
  }
  // Initialize root node
  TreeNode? root = TreeNode(preorder[i]);
  // Query m to divide left and right subtrees
  int m = inorderMap[preorder[i]]!;
  // Subproblem: build left subtree
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // Subproblem: build right subtree
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // Return root node
  return root;
}

/* Build binary tree */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // Initialize hash table, storing in-order elements to indices mapping
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Driver Code */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("Pre-order traversal = $pre-order");
  print("In-order traversal = $in-order");

  TreeNode? root = buildTree(preorder, inorder);
  print("The built binary tree is:");
  printTree(root!);
}
