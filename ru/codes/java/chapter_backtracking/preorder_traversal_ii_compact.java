/**
 * File: preorder_traversal_ii_compact.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_ii_compact {
    static List<TreeNode> path;
    static List<List<TreeNode>> res;

    /* Прямой обход: пример 2 */
    static void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // Пробуем вариант
        path.add(root);
        if (root.val == 7) {
            // Сохраняем решение
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Возврат
        path.remove(path.size() - 1);
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nСоздаём двоичное дерево");
        PrintUtil.printTree(root);

        // Прямой обход
        path = new ArrayList<>();
        res = new ArrayList<>();
        preOrder(root);

        System.out.println("\nВыводим все пути от корня до узлов со значением 7");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
