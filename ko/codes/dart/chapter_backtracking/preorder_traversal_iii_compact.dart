/**
 * File: preorder_traversal_iii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 전위 순회: 예제 3 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null || root.val == 3) {
    return;
  }

  // 시도
  path.add(root);
  if (root.val == 7) {
    // 해를 기록한다
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // 되돌리기
  path.removeLast();
}

/* 실행 코드 */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\n이진 트리 초기화");
  printTree(root);

  // 전위 순회
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\n루트 노드에서 노드 7까지의 모든 경로 출력");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
