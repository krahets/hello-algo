/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 二分木の構築：分割統治法 */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // 部分木の区間が空の場合、終了する
  if (r - l < 0) {
    return null;
  }
  // 根ノードを初期化する
  TreeNode? root = TreeNode(preorder[i]);
  // m を調べ、左右の部分木に分割する
  int m = inorderMap[preorder[i]]!;
  // 部分問題：左部分木の構築
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // 部分問題：右部分木の構築
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // 根ノードを返す
  return root;
}

/* 二分木を構築する */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* 実行用コード */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("行きがけ順走査 = $preorder");
  print("通りがけ順走査 = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("構築した二分木：");
  printTree(root!);
}
