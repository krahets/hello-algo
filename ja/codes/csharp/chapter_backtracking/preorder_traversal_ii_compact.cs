/**
 * File: preorder_traversal_ii_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_ii_compact {
    List<TreeNode> path = [];
    List<List<TreeNode>> res = [];

    /* 行きがけ順走査：例題 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // 試行
        path.Add(root);
        if (root.val == 7) {
            // 解を記録する
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 復元
        path.RemoveAt(path.Count - 1);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化する");
        PrintUtil.PrintTree(root);

        // 行きがけ順走査
        PreOrder(root);

        Console.WriteLine("\n根ノードからノード 7 までのすべての経路を出力する");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
