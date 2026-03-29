/**
 * File: preorder_traversal_i_compact.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_i_compact {
    List<TreeNode> res = [];

    /* 前順走査：例題 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 解を記録
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化");
        PrintUtil.PrintTree(root);

        // 先行順走査
        PreOrder(root);

        Console.WriteLine("\n値が 7 のノードをすべて出力");
        PrintUtil.PrintList(res.Select(p => p.val).ToList());
    }
}
