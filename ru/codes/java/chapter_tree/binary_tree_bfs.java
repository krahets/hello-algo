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
        // Инициализировать очередь и добавить корневой узел
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // Инициализировать список для хранения последовательности обхода
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // Извлечение из очереди
            list.add(node.val);           // Сохранить значение узла
            if (node.left != null)
                queue.offer(node.left);   // Поместить левого потомка в очередь
            if (node.right != null)
                queue.offer(node.right);  // Поместить правого потомка в очередь
        }
        return list;
    }

    public static void main(String[] args) {
        /* Инициализировать двоичное дерево */
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 2, 3, 4, 5, 6, 7));
        System.out.println("\nИнициализировать двоичное дерево\n");
        PrintUtil.printTree(root);

        /* Обход по уровням */
        List<Integer> list = levelOrder(root);
        System.out.println("\nПоследовательность узлов при обходе по уровням =" + list);
    }
}
