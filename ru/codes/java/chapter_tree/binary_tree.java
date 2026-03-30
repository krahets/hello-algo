/**
 * File: binary_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

public class binary_tree {
    public static void main(String[] args) {
        /* Инициализация двоичного дерева */
        // Инициализация узла
        TreeNode n1 = new TreeNode(1);
        TreeNode n2 = new TreeNode(2);
        TreeNode n3 = new TreeNode(3);
        TreeNode n4 = new TreeNode(4);
        TreeNode n5 = new TreeNode(5);
        // Построить связи между узлами (указатели)
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        System.out.println("\nИнициализация двоичного дерева\n");
        PrintUtil.printTree(n1);

        /* Вставка и удаление узлов */
        TreeNode P = new TreeNode(0);
        // Вставить узел P между n1 -> n2
        n1.left = P;
        P.left = n2;
        System.out.println("\nПосле вставки узла P\n");
        PrintUtil.printTree(n1);
        // Удалить узел P
        n1.left = n2;
        System.out.println("\nПосле удаления узла P\n");
        PrintUtil.printTree(n1);
    }
}
