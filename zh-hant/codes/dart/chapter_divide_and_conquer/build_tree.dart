/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 構建二元樹：分治 */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // 子樹區間為空時終止
  if (r - l < 0) {
    return null;
  }
  // 初始化根節點
  TreeNode? root = TreeNode(preorder[i]);
  // 查詢 m ，從而劃分左右子樹
  int m = inorderMap[preorder[i]]!;
  // 子問題：構建左子樹
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // 子問題：構建右子樹
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // 返回根節點
  return root;
}

/* 構建二元樹 */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
  print("前序走訪 = $preorder");
  print("中序走訪 = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("構建的二元樹為：");
  printTree(root!);
}
