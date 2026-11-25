/**
 * File: binary_tree_dfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_dfs {
    // Создать список для последовательности обхода
    static ArrayList<Integer> list = new ArrayList<>();

    /* Прямой обход */
    static void preOrder(TreeNode root) {
        if (root == null)
            return;
        // Порядок посещения: корень -> левое поддерево -> правое поддерево
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* Симметричный обход */
    static void inOrder(TreeNode root) {
        if (root == null)
            return;
        // Порядок посещения: левое поддерево -> корень -> правое поддерево
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* Обратный обход */
    static void postOrder(TreeNode root) {
        if (root == null)
            return;
        // Порядок посещения: левое поддерево -> правое поддерево -> корень
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }

    public static void main(String[] args) {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nИнициализация двоичного дерева\n");
        PrintUtil.printTree(root);

        /* Прямой обход */
        list.clear();
        preOrder(root);
        System.out.println("\nУзлы в порядке прямого обхода = " + list);

        /* Симметричный обход */
        list.clear();
        inOrder(root);
        System.out.println("\nУзлы в порядке симметричного обхода = " + list);

        /* Обратный обход */
        list.clear();
        postOrder(root);
        System.out.println("\nУзлы в порядке обратного обхода = " + list);
    }
}
