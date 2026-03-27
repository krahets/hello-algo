/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* Предварительный обход */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: корень -> левое поддерево -> правое поддерево
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Симметричный обход */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: левое поддерево -> корень -> правое поддерево
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Обратный обход */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок обхода: левое поддерево -> правое поддерево -> корень
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* Инициализация двоичного дерева */
        // Здесь используется функция, напрямую строящая двоичное дерево из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\nПоследовательность печати узлов при предварительном обходе = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\nПоследовательность печати узлов при симметричном обходе = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\nПоследовательность печати узлов при обратном обходе = " + string.Join(",", list));
    }
}
