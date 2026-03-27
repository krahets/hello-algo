/**
 * File: build_tree.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

import utils.*;
import java.util.*;

public class build_tree {
    /* Построить двоичное дерево: разделяй и властвуй */
    static TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return null;
        // Инициализировать корневой узел
        TreeNode root = new TreeNode(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap.get(preorder[i]);
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    static TreeNode buildTree(int[] preorder, int[] inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
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
        System.out.println("Предварительный обход = " + Arrays.toString(preorder));
        System.out.println("Симметричный обход = " + Arrays.toString(inorder));

        TreeNode root = buildTree(preorder, inorder);
        System.out.println("Построенное двоичное дерево:");
        PrintUtil.printTree(root);
    }
}
