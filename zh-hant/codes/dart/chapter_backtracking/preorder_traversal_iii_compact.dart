/**
 * File: preorder_traversal_iii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 前序走訪：例題三 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null || root.val == 3) {
    return;
  }

  // 嘗試
  path.add(root);
  if (root.val == 7) {
    // 記錄此解
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // 回溯
  path.removeLast();
}

/* 主程式 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹");
  printTree(root);

  // 前序走訪
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\n輸出從根節點到值為 7 的節點的所有路徑");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
