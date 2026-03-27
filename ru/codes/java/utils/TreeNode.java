/**
 * File: TreeNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* Класс узла двоичного дерева */
public class TreeNode {
    public int val; // Значение узла
    public int height; // Высота узла
    public TreeNode left; // Ссылка на левый дочерний узел
    public TreeNode right; // Ссылка на правый дочерний узел

    /* Конструктор */
    public TreeNode(int x) {
        val = x;
    }

    // Правила кодирования сериализации см.:
    // https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    // Массивное представление двоичного дерева:
    // [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    // Связное представление двоичного дерева:
    // /——— 15
    // /——— 7
    // /——— 3
    // |    \——— 6
    // |        \——— 12
    // ——— 1
    // \——— 2
    // |    /——— 9
    // \——— 4
    // \——— 8

    /* Десериализовать список в двоичное дерево: рекурсия */
    private static TreeNode listToTreeDFS(List<Integer> arr, int i) {
        if (i < 0 || i >= arr.size() || arr.get(i) == null) {
            return null;
        }
        TreeNode root = new TreeNode(arr.get(i));
        root.left = listToTreeDFS(arr, 2 * i + 1);
        root.right = listToTreeDFS(arr, 2 * i + 2);
        return root;
    }

    /* Десериализовать список в двоичное дерево */
    public static TreeNode listToTree(List<Integer> arr) {
        return listToTreeDFS(arr, 0);
    }

    /* Сериализовать двоичное дерево в список: рекурсия */
    private static void treeToListDFS(TreeNode root, int i, List<Integer> res) {
        if (root == null)
            return;
        while (i >= res.size()) {
            res.add(null);
        }
        res.set(i, root.val);
        treeToListDFS(root.left, 2 * i + 1, res);
        treeToListDFS(root.right, 2 * i + 2, res);
    }

    /* Сериализовать двоичное дерево в список */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> res = new ArrayList<>();
        treeToListDFS(root, 0, res);
        return res;
    }
}
