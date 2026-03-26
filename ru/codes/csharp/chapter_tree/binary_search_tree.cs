/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // Инициализировать пустое дерево
        root = null;
    }

    /* Получить корневой узел двоичного дерева */
    public TreeNode? GetRoot() {
        return root;
    }

    /* Найти узел */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != null) {
            // Целевой узел находится в правом поддереве cur
            if (cur.val < num) cur =
                cur.right;
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

    /* Вставить узел */
    public void Insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != null) {
            // Найти дублирующийся узел и сразу вернуть результат
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

        // Вставить узел
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* Удалить узел */
    public void Remove(int num) {
        // Если дерево пусто, сразу вернуть результат
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != null) {
            // Найти узел для удаления и выйти из цикла
            if (cur.val == num)
                break;
            pre = cur;
            // Удаляемый узел находится в правом поддереве cur
            if (cur.val < num)
                cur = cur.right;
            // Удаляемый узел находится в левом поддереве cur
            else
                cur = cur.left;
        }
        // Если узла для удаления нет, сразу вернуть результат
        if (cur == null)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur.left == null || cur.right == null) {
            // Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
            TreeNode? child = cur.left ?? cur.right;
            // Удалить узел cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // Если удаляемый узел является корневым, заново назначить корневой узел
                root = child;
            }
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Рекурсивно удалить узел tmp
            Remove(tmp.val!.Value);
            // Заменить cur значением tmp
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* Инициализировать двоичное дерево поиска */
        BinarySearchTree bst = new();
        // Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\nИнициализированное двоичное дерево:\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Найти узел */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\nНайденный объект узла равен" + node + ", значение узла =" + node?.val);

        /* Вставить узел */
        bst.Insert(16);
        Console.WriteLine("\nПосле вставки узла 16 двоичное дерево имеет вид\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* Удалить узел */
        bst.Remove(1);
        Console.WriteLine("\nПосле удаления узла 1 двоичное дерево имеет вид\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nПосле удаления узла 2 двоичное дерево имеет вид\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nПосле удаления узла 4 двоичное дерево имеет вид\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
