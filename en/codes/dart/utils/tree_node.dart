/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Binary tree node class */
class TreeNode {
  int val; // Node value
  int height; // Node height
  TreeNode? left; // Reference to left child node
  TreeNode? right; // Reference to right child node

  /* Constructor */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* Deserialize a list into a binary tree: recursion */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* Deserialize a list into a binary tree */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* Serialize a binary tree into a list: recursion */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* Serialize a binary tree into a list */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
