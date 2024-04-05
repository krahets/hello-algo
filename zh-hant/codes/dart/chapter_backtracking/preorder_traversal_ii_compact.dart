/**
 * File: preorder_traversal_ii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 前序走訪：例題二 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null) {
    return;
  }

  // 嘗試
  path.add(root);
  if (root.val == 7) {
    // 記錄解
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // 回退
  path.removeLast();
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹");
  printTree(root);

  // 前序走訪
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\n輸出所有根節點到節點 7 的路徑");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
