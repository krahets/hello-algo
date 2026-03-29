/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* レベル順走査 */
List<int> levelOrder(TreeNode? root) {
  // キューを初期化し、ルートノードを追加する
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 走査順序を保存するためのリストを初期化する
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // デキュー
    res.add(node!.val); // ノードの値を保存する
    if (node.left != null) queue.add(node.left); // 左子ノードをキューに追加
    if (node.right != null) queue.add(node.right); // 右子ノードをキューに追加
  }
  return res;
}

/* Driver Code */
void main() {
  /* 二分木を初期化 */
  // ここでは、配列から直接二分木を生成する関数を利用する
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化\n");
  printTree(root);

  // レベル順走査
  List<int> res = levelOrder(root);
  print("\nレベル順走査のノード出力順 = $res");
}
