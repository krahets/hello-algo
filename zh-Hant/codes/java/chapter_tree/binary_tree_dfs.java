/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // 初始化串列，用於儲存走訪序列
    static ArrayList<Integer> list = new ArrayList<>();

    /* 前序走訪 */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中序走訪 */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 後序走訪 */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\n初始化二元樹\n");
        PrintUtil.printTree(root);

        /* 前序走訪 */
        list.clear();
        preOrder(root);
        System.out.println("\n前序走訪的節點列印序列 = " + list);

        /* 中序走訪 */
        list.clear();
        inOrder(root);
        System.out.println("\n中序走訪的節點列印序列 = " + list);

        /* 後序走訪 */
        list.clear();
        postOrder(root);
        System.out.println("\n後序走訪的節點列印序列 = " + list);
    }
}
