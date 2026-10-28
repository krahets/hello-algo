/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 레벨 순서 순회 */
List<int> levelOrder(TreeNode? root) {
  // 큐를 초기화하고 루트 노드를 넣는다
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 순회 순서를 저장할 리스트를 초기화한다
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // 큐에서 꺼낸다
    res.add(node!.val); // 노드 값을 저장한다
    if (node.left != null) queue.add(node.left); // 왼쪽 자식 노드를 큐에 삽입한다
    if (node.right != null) queue.add(node.right); // 오른쪽 자식 노드를 큐에 삽입한다
  }
  return res;
}

/* 실행 코드 */
void main() {
  /* 이진 트리 초기화 */
  // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n이진 트리 초기화\n");
  printTree(root);

  // 레벨 순서 순회
  List<int> res = levelOrder(root);
  print("\n레벨 순서 순회의 노드 출력 순서 = $res");
}
