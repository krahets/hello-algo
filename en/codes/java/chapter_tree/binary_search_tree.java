/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* Binary search tree */
class BinarySearchTree {
    private TreeNode root;

    /* Constructor */
    public BinarySearchTree() {
        // Initialize empty tree
        root = null;
    }

    /* Get binary tree root node */
    public TreeNode getRoot() {
        return root;
    }

    /* Search node */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num)
                cur = cur.left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }

    /* Insert node */
    public void insert(int num) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found duplicate node, return directly
            if (cur.val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Insertion position is in cur's left subtree
            else
                cur = cur.left;
        }
        // Insert node
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }

    /* Remove node */
    public void remove(int num) {
        // If tree is empty, return directly
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found node to delete, exit loop
            if (cur.val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Node to delete is in cur's left subtree
            else
                cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur == null)
            return;
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Delete node cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            remove(tmp.val);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* Initialize binary search tree */
        BinarySearchTree bst = new BinarySearchTree();
        // Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\nInitialized binary tree is\n");
        PrintUtil.printTree(bst.getRoot());

        /* Search node */
        TreeNode node = bst.search(7);
        System.out.println("\nFound node object is " + node + ", node value = " + node.val);

        /* Insert node */
        bst.insert(16);
        System.out.println("\nAfter inserting node 16, binary tree is\n");
        PrintUtil.printTree(bst.getRoot());

        /* Remove node */
        bst.remove(1);
        System.out.println("\nAfter removing node 1, binary tree is\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\nAfter removing node 2, binary tree is\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\nAfter removing node 4, binary tree is\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
