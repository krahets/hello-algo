/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* АВЛ-дерево */
class AVLTree {
    TreeNode root; // Корень

    /* Получить высоту узла */
    public int height(TreeNode node) {
        // Высота пустого узла равна -1, высота листа равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    private void updateHeight(TreeNode node) {
        // Высота узла на 1 больше высоты самого высокого поддерева
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    public int balanceFactor(TreeNode node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null)
            return 0;
        // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return height(node.left) - height(node.right);
    }

    /* Правый поворот */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Повернуть node вправо вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Левый поворот */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Повернуть node влево вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс поддерева */
    private TreeNode rotate(TreeNode node) {
        // Получить коэффициент баланса узла node
        int balanceFactor = balanceFactor(node);
        // Перевес влево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Поворот вправо
                return rightRotate(node);
            } else {
                // Сначала поворот влево, затем вправо
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Перевес вправо
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Поворот влево
                return leftRotate(node);
            } else {
                // Сначала поворот вправо, затем влево
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано: завершить вызов без поворота
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
        /* 1. Найти место вставки и вставить узел */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Такой узел уже есть: завершить вызов без вставки
        updateHeight(node); // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node);
        // Вернуть корень поддерева
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
        /* 1. Найти и удалить узел */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Нет потомков: удалить node и завершить вызов
                if (child == null)
                    return null;
                // Один потомок: удалить node
                else
                    node = child;
            } else {
                // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = rotate(node);
        // Вернуть корень поддерева
        return node;
    }

    /* Поиск узла */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Искомый узел в правом поддереве cur
            if (cur.val < val)
                cur = cur.right;
            // Искомый узел в левом поддереве cur
            else if (cur.val > val)
                cur = cur.left;
            // Узел найден: выйти из цикла
            else
                break;
        }
        // Вернуть искомый узел
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\nПосле вставки узла " + val + " АВЛ-дерево имеет вид:");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\nПосле удаления узла " + val + " АВЛ-дерево имеет вид:");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* Инициализация пустого АВЛ-дерева */
        AVLTree avlTree = new AVLTree();

        /* Вставка узла */
        // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
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
        // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
        testRemove(avlTree, 8); // Удаление узла без потомков
        testRemove(avlTree, 5); // Удаление узла с одним потомком
        testRemove(avlTree, 4); // Удаление узла с двумя потомками

        /* Поиск узла */
        TreeNode node = avlTree.search(7);
        System.out.println("\nНайденный узел: " + node + ", значение узла = " + node.val);
    }
}
