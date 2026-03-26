/**
 * File: preorder_traversal_i_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_i_compact {
    List<TreeNode> res = [];

    /* Прямой обход: пример 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Записать решение
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализировать двоичное дерево");
        PrintUtil.PrintTree(root);

        // Прямой обход
        PreOrder(root);

        Console.WriteLine("\nВывести все узлы со значением 7");
        PrintUtil.PrintList(res.Select(p => p.val).ToList());
    }
}
