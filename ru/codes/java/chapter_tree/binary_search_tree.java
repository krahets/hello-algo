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
        // Инициализировать пустое дерево
        root = null;
    }

    /* Получить корневой узел двоичного дерева */
    public TreeNode getRoot() {
        return root;
    }

    /* Поиск узла */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > num)
                cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }

    /* Вставка узла */
    public void insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти повторяющийся узел и сразу вернуть
            if (cur.val == num)
                return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Позиция вставки находится в левом поддереве cur
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
        // Если дерево пусто, сразу вернуть
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val == num)
                break;
            pre = cur;
            // Узел для удаления находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Узел для удаления находится в левом поддереве cur
            else
                cur = cur.left;
        }
        // Если узел для удаления отсутствует, сразу вернуть
        if (cur == null)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // Если удаляемый узел является корнем, заново назначить корневой узел
                root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            remove(tmp.val);
            // Перезаписать cur значением tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* Инициализация двоичного дерева поиска */
        BinarySearchTree bst = new BinarySearchTree();
        // Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\nИсходное двоичное дерево\n");
        PrintUtil.printTree(bst.getRoot());

        /* Поиск узла */
        TreeNode node = bst.search(7);
        System.out.println("\nНайденный объект узла = " + node + ", значение узла = " + node.val);

        /* Вставка узла */
        bst.insert(16);
        System.out.println("\nПосле вставки узла 16 двоичное дерево имеет вид\n");
        PrintUtil.printTree(bst.getRoot());

        /* Удаление узла */
        bst.remove(1);
        System.out.println("\nПосле удаления узла 1 двоичное дерево имеет вид\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\nПосле удаления узла 2 двоичное дерево имеет вид\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\nПосле удаления узла 4 двоичное дерево имеет вид\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
