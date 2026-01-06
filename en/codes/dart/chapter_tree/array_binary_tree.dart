/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Binary tree class represented by array */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* Constructor */
  ArrayBinaryTree(this._tree);

  /* List capacity */
  int size() {
    return _tree.length;
  }

  /* Get value of node at index i */
  int? val(int i) {
    // If index out of bounds, return null to represent empty position
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* Get index of left child node of node at index i */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* Get index of right child node of node at index i */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* Get index of parent node of node at index i */
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
    // If empty position, return
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

/* Driver Code */
void main() {
  // Initialize binary tree
  // Here we use a function to generate a binary tree directly from an array
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
  print("Array representation of binary tree:");
  print(arr);
  print("Linked list representation of binary tree:");
  printTree(root);

  // Binary tree class represented by array
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // Access node
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\nCurrent node index is $i, value is ${abt.val(i)}");
  print("Its left child index is $l, value is ${(l == null ? "null" : abt.val(l))}");
  print("Its right child index is $r, value is ${(r == null ? "null" : abt.val(r))}");
  print("Its parent node index is $p, value is ${(p == null ? "null" : abt.val(p))}");

  // Traverse tree
  List<int?> res = abt.levelOrder();
  print("\nLevel-order traversal is: $res");
  res = abt.preOrder();
  print("Pre-order traversal is $res");
  res = abt.inOrder();
  print("In-order traversal is $res");
  res = abt.postOrder();
  print("Post-order traversal is $res");
}
