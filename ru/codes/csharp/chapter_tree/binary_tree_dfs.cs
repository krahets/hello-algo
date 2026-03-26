/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* Прямой обход */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Симметричный обход */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Обратный обход */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* Инициализировать двоичное дерево */
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализировать двоичное дерево\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\nПоследовательность узлов при прямом обходе =" + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\nПоследовательность узлов при симметричном обходе =" + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\nПоследовательность узлов при обратном обходе =" + string.Join(",", list));
    }
}
