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
  // キューを初期化して根を入れる
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // 走査順を記録するリストを初期化する
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // キューの先頭から取り出す
    res.add(node!.val); // ノードの値を記録する
    if (node.left != null) queue.add(node.left); // 左の子をキューに入れる
    if (node.right != null) queue.add(node.right); // 右の子をキューに入れる
  }
  return res;
}

/* 実行例 */
void main() {
  /* 二分木を初期化する */
  // ここでは配列から直接二分木を作る関数を使う
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化\n");
  printTree(root);

  // レベル順走査
  List<int> res = levelOrder(root);
  print("\nレベル順に出力したノードの列 = $res");
}
