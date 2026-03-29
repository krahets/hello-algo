/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// 走査順序を格納するリストを初期化
List<int> list = [];

/* 先行順走査 */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問順序：根ノード -> 左部分木 -> 右部分木
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* 中順走査 */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* 後順走査 */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* 二分木を初期化 */
  // ここでは、配列から直接二分木を生成する関数を利用する
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n二分木を初期化\n");
  printTree(root);

  /* 先行順走査 */
  list.clear();
  preOrder(root);
  print("\n先行順走査のノード出力順 = $list");

  /* 中順走査 */
  list.clear();
  inOrder(root);
  print("\n中間順走査のノード出力順 = $list");

  /* 後順走査 */
  list.clear();
  postOrder(root);
  print("\n後行順走査のノード出力順 = $list");
}
