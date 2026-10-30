/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* Build a binary tree: divide and conquer */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Stop when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new TreeNode(preorder[i]);
        // Look up m to separate the left and right subtrees
        int m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // Initialize a hash table mapping each element in inorder to its index
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }

    public static void main(String[] args) {
        int[] preorder = { 3, 9, 2, 1, 7 };
        int[] inorder = { 9, 3, 1, 2, 7 };
        System.out.println("Preorder traversal = " + Arrays.toString(preorder));
        System.out.println("Inorder traversal = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("The constructed binary tree is:");
        PrintUtil.printTree(root);
    }
}
