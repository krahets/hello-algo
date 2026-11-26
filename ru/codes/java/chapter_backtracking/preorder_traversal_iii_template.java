/**
 * File: preorder_traversal_iii_template.java
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import utils.*;
import java.util.*;

public class preorder_traversal_iii_template {
    /* Проверяем, является ли текущее состояние решением */
    static boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Сохраняем решение */
    static void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Проверяем, допустим ли выбор в текущем состоянии */
    static boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновляем состояние */
    static void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Восстанавливаем состояние */
    static void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Поиск с возвратом: пример 3 */
    static void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверяем, найдено ли решение
        if (isSolution(state)) {
            // Сохраняем решение
            recordSolution(state, res);
        }
        // Перебираем все варианты
        for (TreeNode choice : choices) {
            // Отсечение: проверяем допустимость выбора
            if (isValid(state, choice)) {
                // Пробуем вариант и обновляем состояние
                makeChoice(state, choice);
                // Переходим к следующему выбору
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                undoChoice(state, choice);
            }
        }
    }

    public static void main(String[] args) {
        TreeNode root = TreeNode.listToTree(Arrays.asList(1, 7, 3, 4, 5, 6, 7));
        System.out.println("\nСоздаём двоичное дерево");
        PrintUtil.printTree(root);

        // Поиск с возвратом
        List<List<TreeNode>> res = new ArrayList<>();
        backtrack(new ArrayList<>(), Arrays.asList(root), res);

        System.out.println("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3");
        for (List<TreeNode> path : res) {
            List<Integer> vals = new ArrayList<>();
            for (TreeNode node : path) {
                vals.add(node.val);
            }
            System.out.println(vals);
        }
    }
}
