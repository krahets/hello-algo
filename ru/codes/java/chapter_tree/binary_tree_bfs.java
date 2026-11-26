/**
 * File: binary_tree_bfs.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

public class binary_tree_bfs {
    /* Обход по уровням */
    static List<Integer> levelOrder(TreeNode root) {
        // Создать очередь и добавить корень
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Создать список для последовательности обхода
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Извлечь узел из очереди
            list.add(node.val);           // Сохранить значение узла
            if (node.left != null)
                queue.offer(node.left);   // Добавить левого потомка в очередь
            if (node.right != null)
                queue.offer(node.right);  // Добавить правого потомка в очередь
        }
        return list;
    }

    public static void main(String[] args) {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nИнициализация двоичного дерева\n");
        PrintUtil.printTree(root);

        /* Обход по уровням */
        List<Integer> list = levelOrder(root);
        System.out.println("\nУзлы в порядке обхода по уровням = " + list);
    }
}
