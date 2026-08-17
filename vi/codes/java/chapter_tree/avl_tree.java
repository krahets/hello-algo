/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* AVL tree */
class AVLTree {
    TreeNode root; // Root node

    /* Get node height */
    public int height(TreeNode node) {
        // Empty node height is -1, leaf node height is 0
        return node == null ? -1 : node.height;
    }

    /* Update node height */
    private void updateHeight(TreeNode node) {
        // Node height equals the height of the tallest subtree + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* Get balance factor */
    public int balanceFactor(TreeNode node) {
        // Empty node balance factor is 0
        if (node == null)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node.left) - height(node.right);
    }

    /* Right rotation operation */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Using child as pivot, rotate node to the right
        child.right = node;
        node.left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }

    /* Left rotation operation */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Using child as pivot, rotate node to the left
        child.left = node;
        node.right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return root node of subtree after rotation
        return child;
    }

    /* Perform rotation operation to restore balance to this subtree */
    private TreeNode rotate(TreeNode node) {
        // Get balance factor of node
        int balanceFactor = balanceFactor(node);
        // Left-leaning tree
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Right rotation
                return rightRotate(node);
            } else {
                // First left rotation then right rotation
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Right-leaning tree
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Left rotation
                return leftRotate(node);
            } else {
                // First right rotation then left rotation
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return directly
        return node;
    }

    /* Insert node */
    public void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Recursively insert node (helper method) */
    private TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Duplicate node not inserted, return directly
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }

    /* Remove node */
    public void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Recursively delete node (helper method) */
    private TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. Find node and delete */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Number of child nodes = 0, delete node directly and return
                if (child == null)
                    return null;
                // Number of child nodes = 1, delete node directly
                else
                    node = child;
            } else {
                // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to this subtree */
        node = rotate(node);
        // Return root node of subtree
        return node;
    }

    /* Search node */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < val)
                cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > val)
                cur = cur.left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\nAfter inserting node " + val + ", AVL tree is");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\nAfter removing node " + val + ", AVL tree is");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* Please pay attention to how the AVL tree maintains balance after inserting nodes */
        AVLTree avlTree = new AVLTree();

        /* Insert node */
        // Delete nodes
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

        /* Please pay attention to how the AVL tree maintains balance after deleting nodes */
        testInsert(avlTree, 7);

        /* Remove node */
        // Delete node with degree 1
        testRemove(avlTree, 8); // Delete node with degree 2
        testRemove(avlTree, 5); // Remove node with degree 1
        testRemove(avlTree, 4); // Remove node with degree 2

        /* Search node */
        TreeNode node = avlTree.search(7);
        System.out.println("\nFound node object is " + node + ", node value = " + node.val);
    }
}
