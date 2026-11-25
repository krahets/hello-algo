/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // 走査順を記録するリストを初期化する
    static ArrayList<Integer> list = new ArrayList<>();

    /* 行きがけ順走査 */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問順：根 -> 左部分木 -> 右部分木
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 通りがけ順走査 */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問順：左部分木 -> 根 -> 右部分木
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 帰りがけ順走査 */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問順：左部分木 -> 右部分木 -> 根
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* 二分木を初期化する */
        // ここでは配列から直接二分木を作る関数を使う
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n二分木を初期化\n");
        PrintUtil.printTree(root);

        /* 行きがけ順走査 */
        list.clear();
        preOrder(root);
        System.out.println("\n行きがけ順に出力したノードの列 = " + list);

        /* 通りがけ順走査 */
        list.clear();
        inOrder(root);
        System.out.println("\n通りがけ順に出力したノードの列 = " + list);

        /* 帰りがけ順走査 */
        list.clear();
        postOrder(root);
        System.out.println("\n帰りがけ順に出力したノードの列 = " + list);
    }
}
