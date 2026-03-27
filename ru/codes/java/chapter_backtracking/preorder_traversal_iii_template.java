/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* Проверить, является ли текущее состояние решением */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Записать решение */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновить состояние */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Восстановить состояние */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Алгоритм бэктрекинга: пример 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверить, является ли текущее состояние решением
        if (isSolution(state)) {
            // Записать решение
            recordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        for (TreeNode choice : choices) {
            // Отсечение: проверить допустимость выбора
            if (isValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                makeChoice(state, choice);
                // Перейти к следующему выбору
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nИнициализация двоичного дерева");
        PrintUtil.printTree(root);

        // Алгоритм бэктрекинга
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
