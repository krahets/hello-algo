/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* 初始化二叉树 */
  // 舒适化节点
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // 构建节点之间的引用（指针）
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\n初始化二叉树\n");
  printTree(n1);

  /* 插入与删除节点 */
  TreeNode p = TreeNode(0);
  // 在 n1 -> n2 中间插入节点 p
  n1.left = p;
  p.left = n2;
  print("\n插入节点 P 后\n");
  printTree(n1);
  // 删除节点 P
  n1.left = n2;
  print("\n删除节点 P 后\n");
  printTree(n1);
}
