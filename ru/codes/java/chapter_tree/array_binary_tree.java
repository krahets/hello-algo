/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* Конструктор */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* Ёмкость списка */
    public int size() {
        return tree.size();
    }

    /* Получить значение узла с индексом i */
    public Integer val(int i) {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* Получить индекс левого потомка узла с индексом i */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого потомка узла с индексом i */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родителя узла с индексом i */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* Обход по уровням */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // Пройти непосредственно по массиву
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* Обход в глубину */
    private void dfs(Integer i, String order, List<Integer> res) {
        // Если позиция пуста, завершить вызов
        if (val(i) == null)
            return;
        // Прямой обход
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // Симметричный обход
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // Обратный обход
        if ("post".equals(order))
            res.add(val(i));
    }

    /* Прямой обход */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* Симметричный обход */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* Обратный обход */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // Инициализация двоичного дерева
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\nИнициализация двоичного дерева\n");
        System.out.println("Двоичное дерево в виде массива:");
        System.out.println(arr);
        System.out.println("Связное представление двоичного дерева:");
        PrintUtil.printTree(root);

        // Класс двоичного дерева на основе массива
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // Доступ к узлу
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\nИндекс текущего узла: " + i + " · значение:  " + abt.val(i));
        System.out.println("Индекс левого потомка: " + l + " · значение:  " + (l == null ? "null" : abt.val(l)));
        System.out.println("Индекс правого потомка: " + r + " · значение:  " + (r == null ? "null" : abt.val(r)));
        System.out.println("Индекс родителя: " + p + " · значение:  " + (p == null ? "null" : abt.val(p)));

        // Обход дерева
        List<Integer> res = abt.levelOrder();
        System.out.println("\nОбход по уровням: " + res);
        res = abt.preOrder();
        System.out.println("Прямой обход: " + res);
        res = abt.inOrder();
        System.out.println("Симметричный обход: " + res);
        res = abt.postOrder();
        System.out.println("Обратный обход: " + res);
    }
}
