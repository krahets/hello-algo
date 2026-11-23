/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 이진 트리 노드 클래스 */
class TreeNode {
  int val; // 노드 값
  int height; // 노드 높이
  TreeNode? left; // 왼쪽 자식 노드 참조
  TreeNode? right; // 오른쪽 자식 노드 참조

  /* 생성자 */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* 리스트를 이진 트리로 역직렬화: 재귀 */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* 리스트를 이진 트리로 역직렬화 */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* 이진 트리를 리스트로 직렬화: 재귀 */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* 이진 트리를 리스트로 직렬화 */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
