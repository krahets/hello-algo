/**
 * File: preorder_traversal_ii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 前順走査：例題 2 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null) {
    return;
  }

  // 試す
  path.add(root);
  if (root.val == 7) {
    // 解を記録
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // バックトラック
  path.removeLast();
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化");
  printTree(root);

  // 先行順走査
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\nルートノードからノード 7 までのすべての経路を出力");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
