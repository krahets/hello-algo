/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Array-based binary tree class */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* Constructor */
  ArrayBinaryTree(this._tree);

  /* List capacity */
  int size() {
    return _tree.length;
  }

  /* Get the value of the node at index i */
  int? val(int i) {
    // If the index is out of bounds, return null, representing an empty spot
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* Get the index of the left child of the node at index i */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* Get the index of the right child of the node at index i */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* Get the index of the parent of the node at index i */
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
    // If it is an empty spot, return
    if (val(i) == null) {
      return;
    }
    // Pre-order traversal
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // In-order traversal
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // Post-order traversal
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* Pre-order traversal */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* In-order traversal */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* Post-order traversal */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* Driver Code */
void main() {
  // Initialize binary tree
  // Use a specific function to convert an array into a binary tree
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
  print("\nInitialize binary tree\n");
  print("Binary tree's array representation:");
  print(arr);
  print("Binary tree's linked list representation:");
  printTree(root);

  // Array-based binary tree class
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // Access node
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\nCurrent node's index = $i, value = ${abt.val(i)}");
  print("Its left child's index = $l, value = ${(l == null ? "null" : abt.val(l))}");
  print("Its right child's index = $r, value = ${(r == null ? "null" : abt.val(r))}");
  print("Its parent's index = $p, value = ${(p == null ? "null" : abt.val(p))}");

  // Traverse tree
  List<int?> res = abt.levelOrder();
  print("\nLevel-order traversal = $res");
  res = abt.preOrder();
  print("Pre-order traversal = $res");
  res = abt.inOrder();
  print("In-order traversal = $res");
  res = abt.postOrder();
  print("Post-order traversal = $res");
}
