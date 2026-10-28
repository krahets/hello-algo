/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* 이진 트리 초기화 */
  // 노드를 초기화한다
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // 노드 사이의 참조(포인터)를 설정한다
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\n이진 트리 초기화\n");
  printTree(n1);

  /* 노드 삽입과 삭제 */
  TreeNode p = TreeNode(0);
  // n1 -> n2 사이에 노드 p를 삽입한다
  n1.left = p;
  p.left = n2;
  print("\n노드 P를 삽입한 후\n");
  printTree(n1);
  // 노드 P를 삭제한다
  n1.left = n2;
  print("\n노드 P를 삭제한 후\n");
  printTree(n1);
}
