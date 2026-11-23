/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 이진 트리 구성: 분할 정복 */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // 서브트리 구간이 비어 있으면 종료한다
  if (r - l < 0) {
    return null;
  }
  // 루트 노드를 초기화한다
  TreeNode? root = TreeNode(preorder[i]);
  // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
  int m = inorderMap[preorder[i]]!;
  // 부분 문제: 왼쪽 서브트리 구성
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // 부분 문제: 오른쪽 서브트리 구성
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // 루트 노드를 반환한다
  return root;
}

/* 이진 트리 구성 */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* 실행 코드 */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("전위 순회 = $preorder");
  print("중위 순회 = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("구성한 이진 트리:");
  printTree(root!);
}
