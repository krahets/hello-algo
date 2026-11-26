/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // Инициализация пустого дерева
        root = null;
    }

    /* Получить корень двоичного дерева */
    public TreeNode? GetRoot() {
        return root;
    }

    /* Поиск узла */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Искать в цикле до выхода за пределы листа
        while (cur != null) {
            // Искомый узел в правом поддереве cur
            if (cur.val < num) cur =
                cur.right;
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
    public void Insert(int num) {
        // Если дерево пусто, создать корень
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
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
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* Удаление узла */
    public void Remove(int num) {
        // Если дерево пусто, сразу завершить вызов
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
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
            TreeNode? child = cur.left ?? cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre!.left == cur)
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
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            Remove(tmp.val!.Value);
            // Заменить значение cur значением tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* Инициализация двоичного дерева поиска */
        BinarySearchTree bst = new();
        // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\nИсходное двоичное дерево:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Поиск узла */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\nНайденный узел: " + node + ", значение узла = " + node?.val);

        /* Вставка узла */
        bst.Insert(16);
        Console.WriteLine("\nДвоичное дерево после вставки узла 16:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Удаление узла */
        bst.Remove(1);
        Console.WriteLine("\nДвоичное дерево после удаления узла 1:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nДвоичное дерево после удаления узла 2:\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nДвоичное дерево после удаления узла 4:\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
