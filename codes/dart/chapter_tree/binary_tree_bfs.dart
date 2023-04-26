/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 层序遍历 */
List<int> levelOrder(TreeNode? root) {
  // 初始化队列，加入根节点
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 初始化一个列表，用于保存遍历序列
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // 队列出队
    res.add(node!.val); // 保存节点值
    if (node.left != null) queue.add(node.left); // 左子节点入队
    if (node.right != null) queue.add(node.right); // 右子节点入队
  }
  return res;
}

/* Driver Code */
void main() {
  /* 初始化二叉树 */
  // 这里借助了一个从数组直接生成二叉树的函数
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n初始化二叉树\n");
  printTree(root);

  // 层序遍历
  List<int> res = levelOrder(root);
  print("\n层序遍历的节点打印序列 = $res");
}
