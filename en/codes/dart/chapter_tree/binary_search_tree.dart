/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Binary search tree */
class BinarySearchTree {
  late TreeNode? _root;

  /* Constructor */
  BinarySearchTree() {
    // Initialize an empty tree
    _root = null;
  }

  /* Get the root node of the binary tree */
  TreeNode? getRoot() {
    return _root;
  }

  /* Find a node */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // Search in a loop, stopping if a null reference is reached
    while (cur != null) {
      // The target node lies in the right subtree of cur
      if (cur.val < _num)
        cur = cur.right;
      // The target node lies in the left subtree of cur
      else if (cur.val > _num)
        cur = cur.left;
      // The target node was found; exit the loop
      else
        break;
    }
    // Return the target node
    return cur;
  }

  /* Insert a node */
  void insert(int _num) {
    // If the tree is empty, initialize the root node
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Search in a loop, stopping if a null reference is reached
    while (cur != null) {
      // Return immediately if a duplicate node is found
      if (cur.val == _num) return;
      pre = cur;
      // The insertion position lies in the right subtree of cur
      if (cur.val < _num)
        cur = cur.right;
      // The insertion position lies in the left subtree of cur
      else
        cur = cur.left;
    }
    // Insert a node
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* Remove a node */
  void remove(int _num) {
    // Return immediately if the tree is empty
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Search in a loop, stopping if a null reference is reached
    while (cur != null) {
      // The node to remove was found; exit the loop
      if (cur.val == _num) break;
      pre = cur;
      // The node to remove lies in the right subtree of cur
      if (cur.val < _num)
        cur = cur.right;
      // The node to remove lies in the left subtree of cur
      else
        cur = cur.left;
    }
    // Return if the node to remove does not exist
    if (cur == null) return;
    // Number of children = 0 or 1
    if (cur.left == null || cur.right == null) {
      // With 0 / 1 children, child is null / the child node, respectively
      TreeNode? child = cur.left ?? cur.right;
      // Remove node cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // If the removed node is the root, assign the new root
        _root = child;
      }
    } else {
      // Number of children = 2
      // Get the inorder successor of cur
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // Recursively remove node tmp
      remove(tmp.val);
      // Replace the value of cur with the value of tmp
      cur.val = tmp.val;
    }
  }
}

/* Driver code */
void main() {
  /* Initialize the binary search tree */
  BinarySearchTree bst = BinarySearchTree();
  // Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\nThe initialized binary tree is:\n");
  printTree(bst.getRoot());

  /* Find a node */
  TreeNode? node = bst.search(7);
  print("\nNode found: $node, node value = ${node?.val}");

  /* Insert a node */
  bst.insert(16);
  print("\nBinary tree after inserting node 16:\n");
  printTree(bst.getRoot());

  /* Remove a node */
  bst.remove(1);
  print("\nBinary tree after removing node 1:\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nBinary tree after removing node 2:\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nBinary tree after removing node 4:\n");
  printTree(bst.getRoot());
}
