/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL-дерево */
class AVLTree {
    public TreeNode? root; // Корневой узел

    /* Получить высоту узла */
    int Height(TreeNode? node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void UpdateHeight(TreeNode node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    public int BalanceFactor(TreeNode? node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return Height(node.left) - Height(node.right);
    }

    /* Операция правого вращения */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого вращения */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode? Rotate(TreeNode? node) {
        // Получить коэффициент баланса узла node
        int balanceFactorInt = BalanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Правое вращение
                return RightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Левое вращение
                return LeftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }

    /* Вставка узла */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Повторяющийся узел не вставлять, сразу вернуть
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Удаление узла */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null;
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child;
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Поиск узла */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
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
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nПосле вставки узла " + val + " AVL-дерево имеет вид");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nПосле удаления узла " + val + " AVL-дерево имеет вид");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* Инициализация пустого AVL-дерева */
        AVLTree avlTree = new();

        /* Вставка узла */
        // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
        TestInsert(avlTree, 1);
        TestInsert(avlTree, 2);
        TestInsert(avlTree, 3);
        TestInsert(avlTree, 4);
        TestInsert(avlTree, 5);
        TestInsert(avlTree, 8);
        TestInsert(avlTree, 7);
        TestInsert(avlTree, 9);
        TestInsert(avlTree, 10);
        TestInsert(avlTree, 6);

        /* Вставка повторяющегося узла */
        TestInsert(avlTree, 7);

        /* Удаление узла */
        // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
        TestRemove(avlTree, 8); // Удаление узла степени 0
        TestRemove(avlTree, 5); // Удаление узла степени 1
        TestRemove(avlTree, 4); // Удаление узла степени 2

        /* Поиск узла */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nНайденный объект узла = " + node + ", значение узла = " + node?.val);
    }
}
