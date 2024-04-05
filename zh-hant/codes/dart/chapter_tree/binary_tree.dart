/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* 初始化二元樹 */
  // 舒適化節點
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // 構建節點之間的引用（指標）
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\n初始化二元樹\n");
  printTree(n1);

  /* 插入與刪除節點 */
  TreeNode p = TreeNode(0);
  // 在 n1 -> n2 中間插入節點 p
  n1.left = p;
  p.left = n2;
  print("\n插入節點 P 後\n");
  printTree(n1);
  // 刪除節點 P
  n1.left = n2;
  print("\n刪除節點 P 後\n");
  printTree(n1);
}
