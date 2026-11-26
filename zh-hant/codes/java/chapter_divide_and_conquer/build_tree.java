/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* 建構二元樹：分治法 */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return null;
        // 初始化根節點
        TreeNode root = new TreeNode(preorder[i]);
        // 查出 m，據此劃分左右子樹
        int m = inorderMap.get(preorder[i]);
        // 子問題：建構左子樹
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：建構右子樹
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 回傳根節點
        return root;
    }

    /* 建構二元樹 */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // 初始化雜湊表，記錄 inorder 中各元素對應的索引
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
        System.out.println("前序走訪 = " + Arrays.toString(preorder));
        System.out.println("中序走訪 = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("建構出的二元樹為：");
        PrintUtil.printTree(root);
    }
}
