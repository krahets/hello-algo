/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* Двоичное дерево поиска */
class BinarySearchTree {
    private TreeNode root;

    /* Конструктор */
    public BinarySearchTree() {
        // Инициализация пустого дерева
        root = null;
    }

    /* Получить корень двоичного дерева */
    public TreeNode getRoot() {
        return root;
    }

    /* Поиск узла */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Искомый узел в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Искомый узел в левом поддереве cur
            else if (cur.val > num)
                cur = cur.left;
            // Узел найден: выйти из цикла
            else
                break;
        }
        // Вернуть искомый узел
        return cur;
    }

    /* Вставка узла */
    public void insert(int num) {
        // Если дерево пусто, создать корень
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Такой узел уже есть: завершить вызов
            if (cur.val == num)
                return;
            pre = cur;
            // Место вставки в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Место вставки в левом поддереве cur
            else
                cur = cur.left;
        }
        // Вставка узла
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }

    /* Удаление узла */
    public void remove(int num) {
        // Если дерево пусто, сразу завершить вызов
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Узел для удаления найден: выйти из цикла
            if (cur.val == num)
                break;
            pre = cur;
            // Узел для удаления в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Узел для удаления в левом поддереве cur
            else
                cur = cur.left;
        }
        // Если узел для удаления не найден, завершить вызов
        if (cur == null)
            return;
        // Число потомков равно 0 или 1
        if (cur.left == null || cur.right == null) {
            // Если потомков нет, child = null, если потомок один, child указывает на него
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // Если удаляется корень, назначить новый корень
                root = child;
            }
        }
        // Число потомков равно 2
        else {
            // Найти следующий за cur узел в порядке симметричного обхода
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            remove(tmp.val);
            // Заменить значение cur значением tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* Инициализация двоичного дерева поиска */
        BinarySearchTree bst = new BinarySearchTree();
        // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\nИсходное двоичное дерево:\n");
        PrintUtil.printTree(bst.getRoot());

        /* Поиск узла */
        TreeNode node = bst.search(7);
        System.out.println("\nНайденный узел: " + node + ", значение узла = " + node.val);

        /* Вставка узла */
        bst.insert(16);
        System.out.println("\nДвоичное дерево после вставки узла 16:\n");
        PrintUtil.printTree(bst.getRoot());

        /* Удаление узла */
        bst.remove(1);
        System.out.println("\nДвоичное дерево после удаления узла 1:\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\nДвоичное дерево после удаления узла 2:\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\nДвоичное дерево после удаления узла 4:\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
