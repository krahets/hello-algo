/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

class TreeNode {
  late int val; // 结点值
  late int height; // 结点高度
  late TreeNode? left; // 左子结点引用
  late TreeNode? right; // 右子结点引用

  TreeNode(int x) {
    val = x;
  }
}

/**
     * Generate a binary tree given an array
     * @param list
     * @return
     */
TreeNode? listToTree(List<int> list) {
  int size = list.length;
  if (size == 0) return null;

  TreeNode root = TreeNode(list[0]);
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  int i = 0;
  while (!queue.isEmpty) {
    TreeNode? node = queue.first;
    queue.removeFirst();
    if (++i >= size) break;
    node?.left = TreeNode(list[i]);
    queue.add(node?.left);
    if (++i >= size) break;
    node?.left = TreeNode(list[i]);
    queue.add(node?.right);
  }
  return root;
}

/**
     * Serialize a binary tree to a list
     * @param root
     * @return
     */
List<int?> treeToList(TreeNode? root) {
  List<int?> list = [];
  if (root == null) return list;
  Queue<TreeNode?> queue = Queue();
  queue.add(root);

  while (!queue.isEmpty) {
    TreeNode? node = queue.first;
    queue.removeFirst();
    if (node != null) {
      list.add(node.val);
      queue.add(node.left);
      queue.add(node.right);
    } else {
      list.add(null);
    }
  }
  return list;
}
