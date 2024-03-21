/**
 * File: preorder_traversal_i_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 前序走訪：例題一 */
void preOrder(TreeNode? root, List<TreeNode> res) {
  if (root == null) {
    return;
  }
  if (root.val == 7) {
    // 記錄解
    res.add(root);
  }
  preOrder(root.left, res);
  preOrder(root.right, res);
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹");
  printTree(root);

  // 前序走訪
  List<TreeNode> res = [];
  preOrder(root, res);

  print("\n輸出所有值為 7 的節點");
  print(List.generate(res.length, (i) => res[i].val));
}
