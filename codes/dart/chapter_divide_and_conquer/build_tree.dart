/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 构建二叉树：分治 */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // 子树区间为空时终止
  if (r - l < 0) {
    return null;
  }
  // 初始化根节点
  TreeNode? root = TreeNode(preorder[i]);
  // 查询 m ，从而划分左右子树
  int m = inorderMap[preorder[i]]!;
  // 子问题：构建左子树
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // 子问题：构建右子树
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // 返回根节点
  return root;
}

/* 构建二叉树 */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // 初始化哈希表，存储 inorder 元素到索引的映射
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Driver Code */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("前序遍历 = $preorder");
  print("中序遍历 = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("构建的二叉树为：");
  printTree(root!);
}
