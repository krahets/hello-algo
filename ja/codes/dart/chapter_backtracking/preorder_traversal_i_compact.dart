/**
 * File: preorder_traversal_i_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 行きがけ順走査：例題 1 */
void preOrder(TreeNode? root, List<TreeNode> res) {
  if (root == null) {
    return;
  }
  if (root.val == 7) {
    // 解を記録する
    res.add(root);
  }
  preOrder(root.left, res);
  preOrder(root.right, res);
}

/* 実行用コード */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化する");
  printTree(root);

  // 行きがけ順走査
  List<TreeNode> res = [];
  preOrder(root, res);

  print("\n値が 7 であるすべてのノードを出力する");
  print(List.generate(res.length, (i) => res[i].val));
}
