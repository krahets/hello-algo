/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* АВЛ-дерево */
class AVLTree {
    public TreeNode? root; // Корень

    /* Получить высоту узла */
    int Height(TreeNode? node) {
        // Высота пустого узла равна -1, высота листа равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void UpdateHeight(TreeNode node) {
        // Высота узла на 1 больше высоты самого высокого поддерева
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* Получить коэффициент баланса */
    public int BalanceFactor(TreeNode? node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0;
        // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
        return Height(node.left) - Height(node.right);
    }

    /* Правый поворот */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Повернуть node вправо вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Левый поворот */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Повернуть node влево вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корень поддерева после поворота
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс поддерева */
    TreeNode? Rotate(TreeNode? node) {
        // Получить коэффициент баланса узла node
        int balanceFactorInt = BalanceFactor(node);
        // Перевес влево
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Поворот вправо
                return RightRotate(node);
            } else {
                // Сначала поворот влево, затем вправо
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Перевес вправо
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Поворот влево
                return LeftRotate(node);
            } else {
                // Сначала поворот вправо, затем влево
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Дерево сбалансировано: завершить вызов без поворота
        return node;
    }

    /* Вставка узла */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Найти место вставки и вставить узел */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Такой узел уже есть: завершить вызов без вставки
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = Rotate(node);
        // Вернуть корень поддерева
        return node;
    }

    /* Удаление узла */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Найти и удалить узел */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Нет потомков: удалить node и завершить вызов
                if (child == null)
                    return null;
                // Один потомок: удалить node
                else
                    node = child;
            } else {
                // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Восстановить баланс поддерева с помощью поворота */
        node = Rotate(node);
        // Вернуть корень поддерева
        return node;
    }

    /* Поиск узла */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
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
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nПосле вставки узла " + val + " АВЛ-дерево имеет вид:");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nПосле удаления узла " + val + " АВЛ-дерево имеет вид:");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* Инициализация пустого АВЛ-дерева */
        AVLTree avlTree = new();

        /* Вставка узла */
        // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
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
        // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
        TestRemove(avlTree, 8); // Удаление узла без потомков
        TestRemove(avlTree, 5); // Удаление узла с одним потомком
        TestRemove(avlTree, 4); // Удаление узла с двумя потомками

        /* Поиск узла */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\nНайденный узел: " + node + ", значение узла = " + node?.val);
    }
}
