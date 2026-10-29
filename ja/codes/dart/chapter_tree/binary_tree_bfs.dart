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
  // キューを初期化し、根ノードを追加する
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 走査順序を保存するリストを初期化する
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // キューからデキューする
    res.add(node!.val); // ノードの値を保存する
    if (node.left != null) queue.add(node.left); // 左の子ノードをエンキューする
    if (node.right != null) queue.add(node.right); // 右の子ノードをエンキューする
  }
  return res;
}

/* 実行用コード */
void main() {
  /* 二分木を初期化する */
  // ここでは配列から二分木を直接生成する関数を使う
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化する\n");
  printTree(root);

  // レベル順走査
  List<int> res = levelOrder(root);
  print("\nレベル順走査で表示するノードの順序 = $res");
}
