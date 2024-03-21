/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// 初始化串列，用於儲存走訪序列
List<int> list = [];

/* 前序走訪 */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* 中序走訪 */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* 後序走訪 */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* 初始化二元樹 */
  // 這裡藉助了一個從陣列直接生成二元樹的函式
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\n初始化二元樹\n");
  printTree(root);

  /* 前序走訪 */
  list.clear();
  preOrder(root);
  print("\n前序走訪的節點列印序列 = $list");

  /* 中序走訪 */
  list.clear();
  inOrder(root);
  print("\n中序走訪的節點列印序列 = $list");

  /* 後序走訪 */
  list.clear();
  postOrder(root);
  print("\n後序走訪的節點列印序列 = $list");
}
