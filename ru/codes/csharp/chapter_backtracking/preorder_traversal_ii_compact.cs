/**
 * File: preorder_traversal_ii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Прямой обход: пример 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Попытаться
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
        Console.WriteLine("\nИнициализировать двоичное дерево");
        PrintUtil.PrintTree(root);

        // Прямой обход
        PreOrder(root);

        Console.WriteLine("\nВывести все пути от корня до узла 7");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
