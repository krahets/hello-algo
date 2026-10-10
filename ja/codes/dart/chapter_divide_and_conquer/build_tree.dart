/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 二分木を構築：分割統治 */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // 部分木区間が空なら終了する
  if (r - l < 0) {
    return null;
  }
  // ルートノードを初期化する
  TreeNode? root = TreeNode(preorder[i]);
  // m を求めて左右部分木を分割する
  int m = inorderMap[preorder[i]]!;
  // 部分問題：左部分木を構築する
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // 部分問題：右部分木を構築する
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // 根ノードを返す
  return root;
}

/* 二分木を構築 */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Driver Code */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("前順走査 = $preorder");
  print("中順走査 = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("構築した二分木は：");
  printTree(root!);
}
