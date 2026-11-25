/**
 * File: avl_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

class AVLTree {
  TreeNode? root;

  /* Constructor */
  AVLTree() {
    root = null;
  }

  /* Get the node height */
  int height(TreeNode? node) {
    // A null node has height -1, and a leaf has height 0
    return node == null ? -1 : node.height;
  }

  /* Update the node height */
  void updateHeight(TreeNode? node) {
    // Node height is the height of the taller subtree plus 1
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* Get the balance factor */
  int balanceFactor(TreeNode? node) {
    // A null node has a balance factor of 0
    if (node == null) return 0;
    // Balance factor = left subtree height - right subtree height
    return height(node.left) - height(node.right);
  }

  /* Right rotation */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // Rotate node to the right around child
    child.right = node;
    node.left = grandChild;
    // Update the node height
    updateHeight(node);
    updateHeight(child);
    // Return the root of the rotated subtree
    return child;
  }

  /* Left rotation */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // Rotate node to the left around child
    child.left = node;
    node.right = grandChild;
    // Update the node height
    updateHeight(node);
    updateHeight(child);
    // Return the root of the rotated subtree
    return child;
  }

  /* Rebalance the subtree by rotating it */
  TreeNode? rotate(TreeNode? node) {
    // Get the balance factor of node
    int factor = balanceFactor(node);
    // Left-heavy tree
    if (factor > 1) {
      if (balanceFactor(node!.left) >= 0) {
        // Rotate right
        return rightRotate(node);
      } else {
        // Rotate left, then right
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    // Right-heavy tree
    if (factor < -1) {
      if (balanceFactor(node!.right) <= 0) {
        // Rotate left
        return leftRotate(node);
      } else {
        // Rotate right, then left
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    // The tree is balanced, so return without rotating
    return node;
  }

  /* Insert a node */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* Insert a node recursively (helper method) */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. Find the insertion position and insert the node */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // Return without inserting a duplicate
    updateHeight(node); // Update the node height
    /* 2. Rebalance the subtree by rotating it */
    node = rotate(node);
    // Return the root of the subtree
    return node;
  }

  /* Delete a node */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* Delete a node recursively (helper method) */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. Find the node and delete it */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // No children: delete node and return
        if (child == null)
          return null;
        // One child: delete node
        else
          node = child;
      } else {
        // Two children: delete the inorder successor and use it to replace the current node
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // Update the node height
    /* 2. Rebalance the subtree by rotating it */
    node = rotate(node);
    // Return the root of the subtree
    return node;
  }

  /* Search for a node */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // Stop the search after passing a leaf
    while (cur != null) {
      // The target is in the right subtree of cur
      if (val < cur.val)
        cur = cur.left;
      // The target is in the left subtree of cur
      else if (val > cur.val)
        cur = cur.right;
      // The current node matches the target
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\nAVL tree after inserting $val:");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\nAVL tree after deleting $val:");
  printTree(tree.root);
}

/* Driver code */
void main() {
  /* Initialize an empty AVL tree */
  AVLTree avlTree = AVLTree();
  /* Insert a node */
  // Watch how the AVL tree stays balanced after an insertion
  testInsert(avlTree, 1);
  testInsert(avlTree, 2);
  testInsert(avlTree, 3);
  testInsert(avlTree, 4);
  testInsert(avlTree, 5);
  testInsert(avlTree, 8);
  testInsert(avlTree, 7);
  testInsert(avlTree, 9);
  testInsert(avlTree, 10);
  testInsert(avlTree, 6);

  /* Insert a duplicate node */
  testInsert(avlTree, 7);

  /* Delete a node */
  // Watch how the AVL tree stays balanced after a deletion
  testRemove(avlTree, 8); // Delete a node with no children
  testRemove(avlTree, 5); // Delete a node with one child
  testRemove(avlTree, 4); // Delete a node with two children

  /* Look up a node */
  TreeNode? node = avlTree.search(7);
  print("\nNode found: $node, node value = ${node!.val}");
}
