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
        // Порядок посещения: корень -> левое поддерево -> правое поддерево
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Симметричный обход */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок посещения: левое поддерево -> корень -> правое поддерево
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Обратный обход */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Порядок посещения: левое поддерево -> правое поддерево -> корень
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\nУзлы в порядке прямого обхода = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\nУзлы в порядке симметричного обхода = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\nУзлы в порядке обратного обхода = " + string.Join(",", list));
    }
}
