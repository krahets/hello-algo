/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// 初始化列表，用于存储遍历序列
List<int> list = [];

/* 前序遍历 */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // 访问优先级：根节点 -> 左子树 -> 右子树
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* 中序遍历 */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // 访问优先级：左子树 -> 根节点 -> 右子树
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* 后序遍历 */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // 访问优先级：左子树 -> 右子树 -> 根节点
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* 初始化二叉树 */
  // 这里借助了一个从数组直接生成二叉树的函数
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n初始化二叉树\n");
  printTree(root);

  /* 前序遍历 */
  list.clear();
  preOrder(root);
  print("\n前序遍历的节点打印序列 = $list");

  /* 中序遍历 */
  list.clear();
  inOrder(root);
  print("\n中序遍历的节点打印序列 = $list");

  /* 后序遍历 */
  list.clear();
  postOrder(root);
  print("\n后序遍历的节点打印序列 = $list");
}
