/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL-дерево */
class AVLTree {
    public TreeNode? root; // корневой узел

    /* Получить высоту узла */
    int Height(TreeNode? node) {
        // Высота пустого узла равна -1, а высота листа равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void UpdateHeight(TreeNode node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    public int BalanceFactor(TreeNode? node) {
        // Баланс-фактор пустого узла равен 0
        if (node == null) return 0;
        // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
        return Height(node.left) - Height(node.right);
    }

    /* Операция правого поворота */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Используя child как опорную точку, выполнить правый поворот node
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого поворота */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Используя child как опорную точку, выполнить левый поворот node
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    TreeNode? Rotate(TreeNode? node) {
        // Получить коэффициент баланса узла node
        int balanceFactorInt = BalanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Правый поворот
                return RightRotate(node);
            } else {
                // Сначала выполнить левый поворот, затем правый
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Левый поворот
                return LeftRotate(node);
            } else {
                // Сначала выполнить правый поворот, затем левый
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
        return node;
    }

    /* Вставить узел */
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
            return node;     // Дублирующийся узел не вставлять, сразу вернуть результат
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Удалить узел */
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
                // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                if (child == null)
                    return null;
                // Если число дочерних узлов равно 1, сразу удалить node
                else
                    node = child;
            } else {
                // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* Найти узел */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
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
        /* Инициализировать пустое AVL-дерево */
        AVLTree avlTree = new();

        /* Вставить узел */
        // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
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

        /* Вставить повторяющийся узел */
        TestInsert(avlTree, 7);

        /* Удалить узел */
        // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
        TestRemove(avlTree, 8); // Удалить узел степени 0
        TestRemove(avlTree, 5); // Удалить узел степени 1
        TestRemove(avlTree, 4); // Удалить узел степени 2

        /* Найти узел */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nНайденный объект узла равен" + node + ", значение узла =" + node?.val);
    }
}
