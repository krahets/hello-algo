/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* Build binary tree: Divide and conquer */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Terminate when subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize root node
        TreeNode root = new TreeNode(preorder[i]);
        // Query m to divide left and right subtrees
        int m = inorderMap.get(preorder[i]);
        // Subproblem: build left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return root node
        return root;
    }

    /* Build binary tree */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // Initialize hash table, storing in-order elements to indices mapping
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
        System.out.println("Pre-order traversal = " + Arrays.toString(preorder));
        System.out.println("In-order traversal = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("The built binary tree is:");
        PrintUtil.printTree(root);
    }
}
