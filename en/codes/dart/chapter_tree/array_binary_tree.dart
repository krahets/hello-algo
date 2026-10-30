/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Binary tree class using an array representation */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* Constructor */
  ArrayBinaryTree(this._tree);

  /* Array length, including empty positions */
  int size() {
    return _tree.length;
  }

  /* Get the value of the node at index i */
  int? val(int i) {
    // If the index is out of bounds, return null to indicate an empty position
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* Get the left child index of the node at index i */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* Get the right child index of the node at index i */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* Get the parent index of the node at index i */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* Level-order traversal */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* Depth-first traversal */
  void dfs(int i, String order, List<int?> res) {
    // Return if this position is empty
    if (val(i) == null) {
      return;
    }
    // Preorder traversal
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // Inorder traversal
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // Postorder traversal
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* Preorder traversal */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* Inorder traversal */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* Postorder traversal */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* Driver code */
void main() {
  // Initialize the binary tree
  // Use a helper function that builds a binary tree directly from an array
  List<int?> arr = [
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
  ];

  TreeNode? root = listToTree(arr);
  print("\nInitialize the binary tree\n");
  print("Array representation of the binary tree:");
  print(arr);
  print("Linked representation of the binary tree:");
  printTree(root);

  // Binary tree class using an array representation
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // Access a node
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\nCurrent node: index = $i, value = ${abt.val(i)}");
  print("Left child: index = $l, value = ${(l == null ? "null" : abt.val(l))}");
  print("Right child: index = $r, value = ${(r == null ? "null" : abt.val(r))}");
  print("Parent: index = $p, value = ${(p == null ? "null" : abt.val(p))}");

  // Traverse the tree
  List<int?> res = abt.levelOrder();
  print("\nLevel-order traversal: $res");
  res = abt.preOrder();
  print("Preorder traversal: $res");
  res = abt.inOrder();
  print("Inorder traversal: $res");
  res = abt.postOrder();
  print("Postorder traversal: $res");
}
