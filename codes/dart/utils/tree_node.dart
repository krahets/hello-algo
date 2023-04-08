/**
 * File: tree_node.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

import 'dart:collection';

class TreeNode {
  int val; // 节点值
  int height; // 节点高度
  TreeNode? left; // 左子节点引用
  TreeNode? right; // 右子节点引用

  TreeNode(this.val, [this.height = 0, this.left, this.right]);
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
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst();
    if (++i >= size) break;
    node?.left = TreeNode(list[i]);
    queue.add(node?.left);
    if (++i >= size) break;
    node?.right = TreeNode(list[i]);
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
