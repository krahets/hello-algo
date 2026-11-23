/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return null;
        // Инициализировать корневой узел
        TreeNode root = new(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap[preorder[i]];
        // Подзадача: построить левое поддерево
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }

    [Test]
    public void Test() {
        int[] preorder = [3, 9, 2, 1, 7];
        int[] inorder = [9, 3, 1, 2, 7];
        Console.WriteLine("Предварительный обход = " + string.Join(", ", preorder));
        Console.WriteLine("Симметричный обход = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("Построенное двоичное дерево:");
        PrintUtil.PrintTree(root);
    }
}
