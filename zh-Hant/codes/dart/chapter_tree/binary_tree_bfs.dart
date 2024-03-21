/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 層序走訪 */
List<int> levelOrder(TreeNode? root) {
  // 初始化佇列，加入根節點
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 初始化一個串列，用於儲存走訪序列
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // 隊列出隊
    res.add(node!.val); // 儲存節點值
    if (node.left != null) queue.add(node.left); // 左子節點入列
    if (node.right != null) queue.add(node.right); // 右子節點入列
  }
  return res;
}

/* Driver Code */
void main() {
  /* 初始化二元樹 */
  // 這裡藉助了一個從陣列直接生成二元樹的函式
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹\n");
  printTree(root);

  // 層序走訪
  List<int> res = levelOrder(root);
  print("\n層序走訪的節點列印序列 = $res");
}
