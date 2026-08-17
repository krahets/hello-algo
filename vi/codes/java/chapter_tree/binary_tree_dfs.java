/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // Initialize list for storing traversal sequence
    static ArrayList<Integer> list = new ArrayList<>();

    /* Preorder traversal */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* Inorder traversal */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* Postorder traversal */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> right subtree -> root node
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* Initialize binary tree */
        // Here we use a function to generate a binary tree directly from an array
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize binary tree\n");
        PrintUtil.printTree(root);

        /* Preorder traversal */
        list.clear();
        preOrder(root);
        System.out.println("\nPreorder traversal node print sequence = " + list);

        /* Inorder traversal */
        list.clear();
        inOrder(root);
        System.out.println("\nInorder traversal node print sequence = " + list);

        /* Postorder traversal */
        list.clear();
        postOrder(root);
        System.out.println("\nPostorder traversal node print sequence = " + list);
    }
}
