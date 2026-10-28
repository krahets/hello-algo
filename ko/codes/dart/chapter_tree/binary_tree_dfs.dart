/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// 순회 순서를 저장할 리스트를 초기화한다
List<int> list = [];

/* 전위 순회 */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* 중위 순회 */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* 후위 순회 */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* 실행 코드 */
void main() {
  /* 이진 트리 초기화 */
  // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n이진 트리 초기화\n");
  printTree(root);

  /* 전위 순회 */
  list.clear();
  preOrder(root);
  print("\n전위 순회의 노드 출력 순서 = $list");

  /* 중위 순회 */
  list.clear();
  inOrder(root);
  print("\n중위 순회의 노드 출력 순서 = $list");

  /* 후위 순회 */
  list.clear();
  postOrder(root);
  print("\n후위 순회의 노드 출력 순서 = $list");
}
