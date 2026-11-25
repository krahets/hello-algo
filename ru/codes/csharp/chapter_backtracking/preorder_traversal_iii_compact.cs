/**
 * File: preorder_traversal_iii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* Прямой обход: пример 3 */
    void PreOrder(TreeNode? root) {
        // Отсечение
        if (root == null || root.val == 3) {
            return;
        }
        // Пробуем вариант
        path.Add(root);
        if (root.val == 7) {
            // Сохраняем решение
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Возврат
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nСоздаём двоичное дерево");
        PrintUtil.PrintTree(root);

        // Прямой обход
        PreOrder(root);

        Console.WriteLine("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
