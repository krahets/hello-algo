/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // Initialize the list for storing traversal sequences
    static ArrayList<Integer> list = new ArrayList<>();

    /* Pre-order traversal */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: root node -> left subtree -> right subtree
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* In-order traversal */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // Visit priority: left subtree -> root node -> right subtree
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* Post-order traversal */
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
        // Use a specific function to convert an array into a binary tree
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nInitialize binary tree\n");
        PrintUtil.printTree(root);

        /* Pre-order traversal */
        list.clear();
        preOrder(root);
        System.out.println("\nPrint sequence of nodes from pre-order traversal = " + list);

        /* In-order traversal */
        list.clear();
        inOrder(root);
        System.out.println("\nPrint sequence of nodes from in-order traversal = " + list);

        /* Post-order traversal */
        list.clear();
        postOrder(root);
        System.out.println("\nPrint sequence of nodes from post-order traversal = " + list);
    }
}
