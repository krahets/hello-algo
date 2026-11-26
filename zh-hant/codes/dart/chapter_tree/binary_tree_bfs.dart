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
  // 初始化佇列並加入根節點
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 初始化一個串列，用來儲存走訪序列
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // 從佇列前端取出節點
    res.add(node!.val); // 儲存節點值
    if (node.left != null) queue.add(node.left); // 將左子節點加入佇列
    if (node.right != null) queue.add(node.right); // 將右子節點加入佇列
  }
  return res;
}

/* 主程式 */
void main() {
  /* 初始化二元樹 */
  // 這裡使用能從陣列直接建立二元樹的函式
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹\n");
  printTree(root);

  // 層序走訪
  List<int> res = levelOrder(root);
  print("\n依層序走訪印出的節點序列 = $res");
}
