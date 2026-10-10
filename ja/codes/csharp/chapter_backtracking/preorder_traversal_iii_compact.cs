/**
 * File: preorder_traversal_iii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* 前順走査：例題 3 */
    void PreOrder(TreeNode? root) {
        // 枝刈り
        if (root == null || root.val == 3) {
            return;
        }
        // 試す
        path.Add(root);
        if (root.val == 7) {
            // 解を記録
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // バックトラック
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化");
        PrintUtil.PrintTree(root);

        // 先行順走査
        PreOrder(root);

        Console.WriteLine("\nルートノードからノード 7 までのすべての経路を出力し、経路には値が 3 のノードを含めない");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
