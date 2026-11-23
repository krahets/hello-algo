/**
 * File: preorder_traversal_i_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 전위 순회: 예제 1 */
void preOrder(TreeNode? root, List<TreeNode> res) {
  if (root == null) {
    return;
  }
  if (root.val == 7) {
    // 해를 기록한다
    res.add(root);
  }
  preOrder(root.left, res);
  preOrder(root.right, res);
}

/* 실행 코드 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n이진 트리 초기화");
  printTree(root);

  // 전위 순회
  List<TreeNode> res = [];
  preOrder(root, res);

  print("\n값이 7인 모든 노드 출력");
  print(List.generate(res.length, (i) => res[i].val));
}
