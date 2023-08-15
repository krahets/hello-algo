/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* 二叉树节点类 */
class TreeNode {
  int val; // 节点值
  int height; // 节点高度
  TreeNode? left; // 左子节点引用
  TreeNode? right; // 右子节点引用

  /* 构造方法 */
  TreeNode(this.val, [this.height = 0, this.left, this.right]);
}

/* 将列表反序列化为二叉树：递归 */
TreeNode? listToTreeDFS(List<int?> arr, int i) {
  if (i < 0 || i >= arr.length || arr[i] == null) {
    return null;
  }
  TreeNode? root = TreeNode(arr[i]!);
  root.left = listToTreeDFS(arr, 2 * i + 1);
  root.right = listToTreeDFS(arr, 2 * i + 2);
  return root;
}

/* 将列表反序列化为二叉树 */
TreeNode? listToTree(List<int?> arr) {
  return listToTreeDFS(arr, 0);
}

/* 将二叉树序列化为列表：递归 */
void treeToListDFS(TreeNode? root, int i, List<int?> res) {
  if (root == null) return;
  while (i >= res.length) {
    res.add(null);
  }
  res[i] = root.val;
  treeToListDFS(root.left, 2 * i + 1, res);
  treeToListDFS(root.right, 2 * i + 2, res);
}

/* 将二叉树序列化为列表 */
List<int?> treeToList(TreeNode? root) {
  List<int?> res = [];
  treeToListDFS(root, 0, res);
  return res;
}
