/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // 走査順序を格納するリストを初期化
    static ArrayList<Integer> list = new ArrayList<>();

    /* 前順走査 */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 根ノード -> 左部分木 -> 右部分木
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中順走査 */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 左部分木 -> 根ノード -> 右部分木
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 後順走査 */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 左部分木 -> 右部分木 -> 根ノード
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* 二分木を初期化 */
        // 特定の関数を使用して配列を二分木に変換
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化\n");
        PrintUtil.printTree(root);

        /* 前順走査 */
        list.clear();
        preOrder(root);
        System.out.println("\n前順走査でのノードの出力順序 = " + list);

        /* 中順走査 */
        list.clear();
        inOrder(root);
        System.out.println("\n中順走査でのノードの出力順序 = " + list);

        /* 後順走査 */
        list.clear();
        postOrder(root);
        System.out.println("\n後順走査でのノードの出力順序 = " + list);
    }
}