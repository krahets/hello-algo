/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* Класс узла двоичного дерева */
public class TreeNode(int? x) {
    public int? val = x;    // Значение узла
    public int height;      // Высота узла
    public TreeNode? left;  // Ссылка на левый дочерний узел
    public TreeNode? right; // Ссылка на правый дочерний узел

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
    static TreeNode? ListToTreeDFS(List<int?> arr, int i) {
        if (i < 0 || i >= arr.Count || !arr[i].HasValue) {
            return null;
        }
        TreeNode root = new(arr[i]) {
            left = ListToTreeDFS(arr, 2 * i + 1),
            right = ListToTreeDFS(arr, 2 * i + 2)
        };
        return root;
    }

    /* Десериализовать список в двоичное дерево */
    public static TreeNode? ListToTree(List<int?> arr) {
        return ListToTreeDFS(arr, 0);
    }

    /* Сериализовать двоичное дерево в список: рекурсия */
    static void TreeToListDFS(TreeNode? root, int i, List<int?> res) {
        if (root == null)
            return;
        while (i >= res.Count) {
            res.Add(null);
        }
        res[i] = root.val;
        TreeToListDFS(root.left, 2 * i + 1, res);
        TreeToListDFS(root.right, 2 * i + 2, res);
    }

    /* Сериализовать двоичное дерево в список */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> res = [];
        TreeToListDFS(root, 0, res);
        return res;
    }
}
