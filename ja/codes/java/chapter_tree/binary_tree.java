/**
 * File: binary_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

public class binary_tree {
    public static void main(String[] args) {
        /* 二分木を初期化 */
        // ノードを初期化
        TreeNode n1 = new TreeNode(1);
        TreeNode n2 = new TreeNode(2);
        TreeNode n3 = new TreeNode(3);
        TreeNode n4 = new TreeNode(4);
        TreeNode n5 = new TreeNode(5);
        // ノードの参照（ポインタ）を構築
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        System.out.println("\n二分木を初期化\n");
        PrintUtil.printTree(n1);

        /* ノードの挿入と削除 */
        TreeNode P = new TreeNode(0);
        // ノード P を n1 -> n2 の間に挿入
        n1.left = P;
        P.left = n2;
        System.out.println("\nノード P を挿入後\n");
        PrintUtil.printTree(n1);
        // ノード P を削除
        n1.left = n2;
        System.out.println("\nノード P を削除後\n");
        PrintUtil.printTree(n1);
    }
}