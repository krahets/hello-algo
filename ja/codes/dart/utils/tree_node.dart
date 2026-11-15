/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 二分木のノードクラス */
class TreeNode {
  int val; // ノードの値
  int height; // ノードの高さ
  TreeNode? left; // 左の子ノードへの参照
  TreeNode? right; // 右の子ノードへの参照

  /* コンストラクタ */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* リストから二分木へデシリアライズ：再帰 */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* リストから二分木へデシリアライズ */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* 二分木をシリアライズしてリストにする：再帰 */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* 二分木をシリアライズしてリストにする */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
