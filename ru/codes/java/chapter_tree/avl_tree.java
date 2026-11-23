/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* AVL-дерево */
class AVLTree {
    TreeNode root; // Корневой узел

    /* Получить высоту узла */
    public int height(TreeNode node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    private void updateHeight(TreeNode node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    public int balanceFactor(TreeNode node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null)
            return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node.left) - height(node.right);
    }

    /* Операция правого вращения */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого вращения */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    private TreeNode rotate(TreeNode node) {
        // Получить коэффициент баланса узла node
        int balanceFactor = balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Правое вращение
                return rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Левое вращение
                return leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }

    /* Вставка узла */
    public void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    private TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Повторяющийся узел не вставлять, сразу вернуть
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Удаление узла */
    public void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    private TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null;
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child;
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Поиск узла */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // Искать в цикле и выйти после прохода за листовой узел
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < val)
                cur = cur.right;
            // Целевой узел находится в левом поддереве cur
            else if (cur.val > val)
                cur = cur.left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\nПосле вставки узла " + val + " AVL-дерево имеет вид");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\nПосле удаления узла " + val + " AVL-дерево имеет вид");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* Инициализация пустого AVL-дерева */
        AVLTree avlTree = new AVLTree();

        /* Вставка узла */
        // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
        testInsert(avlTree, 1);
        testInsert(avlTree, 2);
        testInsert(avlTree, 3);
        testInsert(avlTree, 4);
        testInsert(avlTree, 5);
        testInsert(avlTree, 8);
        testInsert(avlTree, 7);
        testInsert(avlTree, 9);
        testInsert(avlTree, 10);
        testInsert(avlTree, 6);

        /* Вставка повторяющегося узла */
        testInsert(avlTree, 7);

        /* Удаление узла */
        // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
        testRemove(avlTree, 8); // Удаление узла степени 0
        testRemove(avlTree, 5); // Удаление узла степени 1
        testRemove(avlTree, 4); // Удаление узла степени 2

        /* Поиск узла */
        TreeNode node = avlTree.search(7);
        System.out.println("\nНайденный объект узла = " + node + ", значение узла = " + node.val);
    }
}
