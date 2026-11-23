/**
 * File: preorder_traversal_iii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 行きがけ順走査：例題 3 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null || root.val == 3) {
    return;
  }

  // 試行
  path.add(root);
  if (root.val == 7) {
    // 解を記録する
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // 復元
  path.removeLast();
}

/* 実行用コード */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化する");
  printTree(root);

  // 行きがけ順走査
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\n根ノードからノード 7 までのすべての経路を出力する");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
