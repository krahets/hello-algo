/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* 二分木の構築：分割統治法 */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 部分木の区間が空の場合、終了する
        if (r - l < 0)
            return null;
        // 根ノードを初期化する
        TreeNode root = new TreeNode(preorder[i]);
        // m を調べ、左右の部分木に分割する
        int m = inorderMap.get(preorder[i]);
        // 部分問題：左部分木の構築
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 部分問題：右部分木の構築
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 根ノードを返す
        return root;
    }

    /* 二分木を構築する */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
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
        System.out.println("行きがけ順走査 = " + Arrays.toString(preorder));
        System.out.println("通りがけ順走査 = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("構築した二分木：");
        PrintUtil.printTree(root);
    }
}
