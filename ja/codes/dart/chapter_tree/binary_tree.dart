/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* 二分木を初期化 */
  // ノードをヒープ化
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // ノード間の参照（ポインタ）を構築する
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\n二分木を初期化\n");
  printTree(n1);

  /* ノードの挿入と削除 */
  TreeNode p = TreeNode(0);
  // n1 -> n2 の間にノード p を挿入する
  n1.left = p;
  p.left = n2;
  print("\nノード P を挿入後\n");
  printTree(n1);
  // ノード P を削除
  n1.left = n2;
  print("\nノード P を削除後\n");
  printTree(n1);
}
