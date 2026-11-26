/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// 走査順を記録するリストを初期化する
List<int> list = [];

/* 行きがけ順走査 */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問順：根 -> 左部分木 -> 右部分木
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* 通りがけ順走査 */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問順：左部分木 -> 根 -> 右部分木
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* 帰りがけ順走査 */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問順：左部分木 -> 右部分木 -> 根
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* 実行例 */
void main() {
  /* 二分木を初期化する */
  // ここでは配列から直接二分木を作る関数を使う
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化\n");
  printTree(root);

  /* 行きがけ順走査 */
  list.clear();
  preOrder(root);
  print("\n行きがけ順に出力したノードの列 = $list");

  /* 通りがけ順走査 */
  list.clear();
  inOrder(root);
  print("\n通りがけ順に出力したノードの列 = $list");

  /* 帰りがけ順走査 */
  list.clear();
  postOrder(root);
  print("\n帰りがけ順に出力したノードの列 = $list");
}
