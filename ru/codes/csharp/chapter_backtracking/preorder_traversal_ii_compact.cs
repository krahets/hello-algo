/**
 * File: preorder_traversal_ii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Предварительный обход: пример 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Попытка
        path.Add(root);
        if (root.val == 7) {
            // Записать решение
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Откат
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева");
        PrintUtil.PrintTree(root);

        // Предварительный обход
        PreOrder(root);

        Console.WriteLine("\nВсе пути от корня к узлу 7");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
