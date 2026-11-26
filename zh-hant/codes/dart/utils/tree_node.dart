/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 二元樹節點類別 */
class TreeNode {
  int val; // 節點值
  int height; // 節點高度
  TreeNode? left; // 指向左子節點的參照
  TreeNode? right; // 指向右子節點的參照

  /* 建構方法 */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* 以遞迴方式將串列反序列化為二元樹 */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* 將串列反序列化為二元樹 */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* 以遞迴方式將二元樹序列化為串列 */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* 將二元樹序列化為串列 */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
