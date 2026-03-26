/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* Класс двоичного дерева в массивном представлении */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* Конструктор */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* Вместимость списка */
    public int size() {
        return tree.size();
    }

    /* Получить значение узла с индексом i */
    public Integer val(int i) {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую клетку
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла узла с индексом i */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* Обход по уровням */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // Непосредственно обойти массив
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* Обход в глубину */
    private void dfs(Integer i, String order, List<Integer> res) {
        // Если это пустая клетка, вернуть результат
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
        // Инициализировать двоичное дерево
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\nИнициализировать двоичное дерево\n");
        System.out.println("Массивное представление двоичного дерева:");
        System.out.println(arr);
        System.out.println("Связное представление двоичного дерева:");
        PrintUtil.printTree(root);

        // Класс двоичного дерева в массивном представлении
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // Получить доступ к узлу
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\nИндекс текущего узла равен" + i + ", значение равно" + abt.val(i));
        System.out.println("Индекс его левого дочернего узла равен" + l + ", значение равно" + (l == null ? "null": abt.val(l)));
        System.out.println("Индекс его правого дочернего узла равен" + r + ", значение равно" + (r == null ? "null": abt.val(r)));
        System.out.println("Индекс его родительского узла равен" + p + ", значение равно" + (p == null ? "null": abt.val(p)));

        // Обойти дерево
        List<Integer> res = abt.levelOrder();
        System.out.println("\nобход по уровнямравно:" + res);
        res = abt.preOrder();
        System.out.println("прямой обходравно:" + res);
        res = abt.inOrder();
        System.out.println("симметричный обходравно:" + res);
        res = abt.postOrder();
        System.out.println("обратный обходравно:" + res);
    }
}
